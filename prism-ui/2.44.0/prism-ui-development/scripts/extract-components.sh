#!/bin/bash
#
# extract-components.sh
# Extracts component information from prism-ui repository
#
# Usage: ./extract-components.sh <prism-ui-path> <output-dir>
#

set -e

PRISM_UI_PATH="${1:-/Users/abito.prakash/Projects/prism-ui}"
OUTPUT_DIR="${2:-./output}"

COMPONENTS_DIR="$PRISM_UI_PATH/services/src/components/v2"
ACCESSIBILITY_FILE="$PRISM_UI_PATH/services/accessibility.md"
PACKAGE_JSON="$PRISM_UI_PATH/services/package.json"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
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

# Validate paths
if [ ! -d "$PRISM_UI_PATH" ]; then
    log_error "Prism UI path not found: $PRISM_UI_PATH"
    exit 1
fi

if [ ! -d "$COMPONENTS_DIR" ]; then
    log_error "Components directory not found: $COMPONENTS_DIR"
    exit 1
fi

# Get version from package.json
VERSION=$(grep '"version"' "$PACKAGE_JSON" | head -1 | sed 's/.*"version": "\([^"]*\)".*/\1/')
log_info "Prism UI Version: $VERSION"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Extract component list
log_info "Extracting component list..."
COMPONENT_LIST="$OUTPUT_DIR/component-list.txt"
find "$COMPONENTS_DIR" -maxdepth 1 -type d | sort | while read dir; do
    basename "$dir"
done > "$COMPONENT_LIST"

# Extract all TypeScript interfaces for props
log_info "Extracting TypeScript interfaces..."
PROPS_FILE="$OUTPUT_DIR/props-interfaces.txt"
> "$PROPS_FILE"

find "$COMPONENTS_DIR" -name "*.tsx" -type f | while read file; do
    component_name=$(basename "$(dirname "$file")")
    # Extract interface definitions that end with Props
    if grep -q "interface.*Props" "$file" 2>/dev/null; then
        echo "=== $component_name ===" >> "$PROPS_FILE"
        # Extract the interface block
        awk '/interface.*Props/,/^}/' "$file" >> "$PROPS_FILE" 2>/dev/null || true
        echo "" >> "$PROPS_FILE"
    fi
done

# Extract accessibility information from examples files
log_info "Extracting accessibility information..."
A11Y_FILE="$OUTPUT_DIR/accessibility-notes.txt"
> "$A11Y_FILE"

find "$COMPONENTS_DIR" -name "*.examples.md" -type f | while read file; do
    component_name=$(basename "$(dirname "$file")")
    # Look for accessibility-related content
    if grep -qi "accessibility\|aria-\|a11y" "$file" 2>/dev/null; then
        echo "=== $component_name ===" >> "$A11Y_FILE"
        # Extract lines containing accessibility info
        grep -i "accessibility\|aria-\|a11y\|screen reader\|keyboard\|focus" "$file" >> "$A11Y_FILE" 2>/dev/null || true
        echo "" >> "$A11Y_FILE"
    fi
done

# Extract icon list
log_info "Extracting icon list..."
ICONS_FILE="$OUTPUT_DIR/icons-list.txt"
if [ -d "$COMPONENTS_DIR/Icons" ]; then
    find "$COMPONENTS_DIR/Icons" -name "*Icon.tsx" -type f | while read file; do
        basename "$file" .tsx
    done | sort > "$ICONS_FILE"
else
    log_warn "Icons directory not found"
    touch "$ICONS_FILE"
fi

# Extract component categories from index.ts
log_info "Extracting component categories..."
INDEX_FILE="$PRISM_UI_PATH/services/src/index.ts"
CATEGORIES_FILE="$OUTPUT_DIR/categories.txt"
if [ -f "$INDEX_FILE" ]; then
    # Extract section comments and exports
    grep -E "^//|^export" "$INDEX_FILE" > "$CATEGORIES_FILE" 2>/dev/null || true
else
    log_warn "Index file not found: $INDEX_FILE"
    touch "$CATEGORIES_FILE"
fi

# Copy accessibility guidelines
log_info "Copying accessibility guidelines..."
if [ -f "$ACCESSIBILITY_FILE" ]; then
    cp "$ACCESSIBILITY_FILE" "$OUTPUT_DIR/accessibility-guidelines.md"
else
    log_warn "Accessibility file not found: $ACCESSIBILITY_FILE"
fi

# Generate component summary
log_info "Generating component summary..."
SUMMARY_FILE="$OUTPUT_DIR/summary.json"
cat > "$SUMMARY_FILE" << EOF
{
  "version": "$VERSION",
  "extractedAt": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "prismUiPath": "$PRISM_UI_PATH",
  "componentCount": $(find "$COMPONENTS_DIR" -maxdepth 1 -type d | wc -l | tr -d ' '),
  "iconCount": $(wc -l < "$ICONS_FILE" | tr -d ' '),
  "examplesCount": $(find "$COMPONENTS_DIR" -name "*.examples.md" | wc -l | tr -d ' ')
}
EOF

log_info "Extraction complete!"
log_info "Output directory: $OUTPUT_DIR"
log_info "Files created:"
ls -la "$OUTPUT_DIR"
