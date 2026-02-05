#!/bin/bash
#
# generate-skill.sh
# Main script to generate prism-ui-development skill for a specific version
#
# Usage: ./generate-skill.sh <prism-ui-path> <version> <output-dir>
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$(dirname "$SCRIPT_DIR")"
TEMPLATES_DIR="$SKILL_DIR/templates"

PRISM_UI_PATH="${1:?Error: prism-ui path required}"
VERSION="${2:?Error: version required}"
OUTPUT_BASE="${3:-.}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
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

log_header() {
    echo -e "\n${CYAN}========================================${NC}"
    echo -e "${CYAN}  $1${NC}"
    echo -e "${CYAN}========================================${NC}\n"
}

# Validate inputs
if [ ! -d "$PRISM_UI_PATH" ]; then
    log_error "Prism UI path not found: $PRISM_UI_PATH"
    exit 1
fi

if [ ! -d "$TEMPLATES_DIR" ]; then
    log_error "Templates directory not found: $TEMPLATES_DIR"
    exit 1
fi

OUTPUT_DIR="$OUTPUT_BASE/prism-ui/$VERSION"
SKILL_OUTPUT_DIR="$OUTPUT_DIR/prism-ui-development"

log_header "Prism UI Skill Generator"
log_info "Prism UI Path: $PRISM_UI_PATH"
log_info "Target Version: $VERSION"
log_info "Output Directory: $OUTPUT_DIR"

# ============================================
# Step 1: Checkout the version
# ============================================
log_header "Step 1: Git Checkout"

if [ -f "$SCRIPT_DIR/checkout-version.sh" ]; then
    bash "$SCRIPT_DIR/checkout-version.sh" "$PRISM_UI_PATH" "$VERSION"
else
    log_warn "checkout-version.sh not found, assuming already on correct version"
fi

# ============================================
# Step 2: Create output directory structure
# ============================================
log_header "Step 2: Creating Directory Structure"

mkdir -p "$SKILL_OUTPUT_DIR/components/complex"
mkdir -p "$SKILL_OUTPUT_DIR/scripts"

log_info "Created directory structure at: $SKILL_OUTPUT_DIR"

# ============================================
# Step 3: Copy and process templates
# ============================================
log_header "Step 3: Processing Templates"

# Function to process template (replace {{VERSION}} placeholder)
process_template() {
    local src="$1"
    local dst="$2"
    if [ -f "$src" ]; then
        sed "s/{{VERSION}}/$VERSION/g" "$src" > "$dst"
        log_info "Generated: $dst"
    else
        log_warn "Template not found: $src"
    fi
}

# Main skill file
process_template "$TEMPLATES_DIR/SKILL.md.template" "$SKILL_OUTPUT_DIR/SKILL.md"

# Pattern and mapping guides
process_template "$TEMPLATES_DIR/component-patterns.md.template" "$SKILL_OUTPUT_DIR/component-patterns.md"
process_template "$TEMPLATES_DIR/component-mapping.md.template" "$SKILL_OUTPUT_DIR/component-mapping.md"
process_template "$TEMPLATES_DIR/accessibility.md.template" "$SKILL_OUTPUT_DIR/accessibility.md"

# Component category files
for template in "$TEMPLATES_DIR/components"/*.template; do
    if [ -f "$template" ]; then
        filename=$(basename "$template" .template)
        process_template "$template" "$SKILL_OUTPUT_DIR/components/$filename"
    fi
done

# Complex component files
for template in "$TEMPLATES_DIR/components/complex"/*.template; do
    if [ -f "$template" ]; then
        filename=$(basename "$template" .template)
        process_template "$template" "$SKILL_OUTPUT_DIR/components/complex/$filename"
    fi
done

# ============================================
# Step 4: Extract component information
# ============================================
log_header "Step 4: Extracting Component Information"

# Run extraction script if available
if [ -f "$SCRIPT_DIR/extract-components.sh" ]; then
    bash "$SCRIPT_DIR/extract-components.sh" "$PRISM_UI_PATH" "$SKILL_OUTPUT_DIR/extracted" || true
fi

# ============================================
# Step 5: Copy utility scripts
# ============================================
log_header "Step 5: Copying Utility Scripts"

# Copy extraction scripts to output
cp "$SCRIPT_DIR/extract-components.sh" "$SKILL_OUTPUT_DIR/scripts/" 2>/dev/null || true
cp "$SCRIPT_DIR/analyze-components.py" "$SKILL_OUTPUT_DIR/scripts/" 2>/dev/null || true

# Make scripts executable
chmod +x "$SKILL_OUTPUT_DIR/scripts/"*.sh 2>/dev/null || true
chmod +x "$SKILL_OUTPUT_DIR/scripts/"*.py 2>/dev/null || true

log_info "Copied utility scripts"

# ============================================
# Step 6: Create zip archive
# ============================================
log_header "Step 6: Creating Zip Archive"

cd "$OUTPUT_DIR"
ZIP_FILE="prism-ui-development.zip"

# Remove existing zip if present
rm -f "$ZIP_FILE"

# Create zip
zip -r "$ZIP_FILE" prism-ui-development/

if [ -f "$ZIP_FILE" ]; then
    ZIP_SIZE=$(ls -lh "$ZIP_FILE" | awk '{print $5}')
    log_info "Created: $OUTPUT_DIR/$ZIP_FILE ($ZIP_SIZE)"
else
    log_error "Failed to create zip file"
fi

# ============================================
# Summary
# ============================================
log_header "Generation Complete!"

echo -e "Output location: ${GREEN}$OUTPUT_DIR${NC}"
echo -e ""
echo -e "Generated files:"
find "$SKILL_OUTPUT_DIR" -type f -name "*.md" | while read file; do
    echo -e "  - $(basename "$file")"
done
echo -e ""
echo -e "Zip archive: ${GREEN}$OUTPUT_DIR/$ZIP_FILE${NC}"
echo -e ""
echo -e "To use this skill:"
echo -e "  1. Copy ${CYAN}prism-ui-development${NC} folder to your ${CYAN}.cursor/skills/${NC} directory"
echo -e "  2. Or extract ${CYAN}$ZIP_FILE${NC} to your workspace"
echo -e ""
