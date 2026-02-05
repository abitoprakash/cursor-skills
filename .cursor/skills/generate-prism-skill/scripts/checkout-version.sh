#!/bin/bash
#
# checkout-version.sh
# Checks out a specific version of prism-ui
#
# Usage: ./checkout-version.sh <prism-ui-path> <version>
#

set -e

PRISM_UI_PATH="${1:?Error: prism-ui path required}"
VERSION="${2:?Error: version required}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log_step() {
    echo -e "${BLUE}[STEP]${NC} $1"
}

# Validate prism-ui path
if [ ! -d "$PRISM_UI_PATH" ]; then
    log_error "Prism UI path not found: $PRISM_UI_PATH"
    exit 1
fi

if [ ! -d "$PRISM_UI_PATH/.git" ]; then
    log_error "Not a git repository: $PRISM_UI_PATH"
    exit 1
fi

cd "$PRISM_UI_PATH"

log_info "Working with prism-ui at: $PRISM_UI_PATH"
log_info "Target version: $VERSION"

# Step 1: Fetch latest from origin
log_step "Fetching from origin..."
git fetch origin --tags --prune

# Step 2: Discard any local changes
log_step "Discarding local changes..."
git checkout -- . 2>/dev/null || true
git clean -fd 2>/dev/null || true

# Step 3: Try to delete existing branch if it exists
log_step "Cleaning up existing branch if any..."
git branch -D "$VERSION" 2>/dev/null || true

# Step 4: Try different checkout strategies
log_step "Checking out version $VERSION..."

checkout_success=false

# Strategy 1: Try tag with 'v' prefix
if git rev-parse "tags/v$VERSION" >/dev/null 2>&1; then
    log_info "Found tag v$VERSION"
    git checkout "tags/v$VERSION" -b "$VERSION"
    checkout_success=true
fi

# Strategy 2: Try tag without 'v' prefix
if [ "$checkout_success" = false ]; then
    if git rev-parse "tags/$VERSION" >/dev/null 2>&1; then
        log_info "Found tag $VERSION"
        git checkout "tags/$VERSION" -b "$VERSION"
        checkout_success=true
    fi
fi

# Strategy 3: Try remote branch
if [ "$checkout_success" = false ]; then
    if git rev-parse "origin/$VERSION" >/dev/null 2>&1; then
        log_info "Found remote branch $VERSION"
        git checkout -b "$VERSION" "origin/$VERSION"
        checkout_success=true
    fi
fi

# Strategy 4: Try as a commit hash
if [ "$checkout_success" = false ]; then
    if git rev-parse "$VERSION" >/dev/null 2>&1; then
        log_info "Using $VERSION as commit reference"
        git checkout "$VERSION" -b "version-$VERSION"
        checkout_success=true
    fi
fi

if [ "$checkout_success" = false ]; then
    log_error "Could not checkout version: $VERSION"
    log_error "Available tags:"
    git tag -l | grep -E "^v?[0-9]+\.[0-9]+" | tail -20
    exit 1
fi

# Verify checkout
CURRENT_VERSION=$(git describe --tags --always 2>/dev/null || echo "unknown")
log_info "Successfully checked out: $CURRENT_VERSION"

# Get version from package.json if available
PACKAGE_JSON="$PRISM_UI_PATH/services/package.json"
if [ -f "$PACKAGE_JSON" ]; then
    PKG_VERSION=$(grep '"version"' "$PACKAGE_JSON" | head -1 | sed 's/.*"version": "\([^"]*\)".*/\1/')
    log_info "Package.json version: $PKG_VERSION"
fi

log_info "Checkout complete!"
