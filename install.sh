#!/bin/bash

set -e

REPO_URL="https://github.com/theplant/global_workflows"
INSTALL_DIR="$HOME/.codeium/windsurf/global_workflows"
TEMP_DIR=$(mktemp -d)

echo "Installing ThePlant Global Workflows..."

# Clean up temp directory on exit
trap "rm -rf $TEMP_DIR" EXIT

# Clone the repository
echo "Downloading workflows..."
git clone --depth 1 "$REPO_URL" "$TEMP_DIR" 2>/dev/null || {
    echo "Error: Failed to clone repository. Please check your internet connection."
    exit 1
}

# Create install directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Copy workflow files
echo "Installing to $INSTALL_DIR..."
cp "$TEMP_DIR"/*.md "$INSTALL_DIR/" 2>/dev/null || true

# Count installed files
INSTALLED_COUNT=$(ls -1 "$INSTALL_DIR"/*.md 2>/dev/null | wc -l | tr -d ' ')

echo ""
echo "✅ Successfully installed $INSTALLED_COUNT workflow(s) to:"
echo "   $INSTALL_DIR"
echo ""
echo "Available workflows:"
for f in "$INSTALL_DIR"/*.md; do
    if [ -f "$f" ]; then
        basename "$f" .md | sed 's/^/   - \//'
    fi
done
echo ""
echo "Use these workflows in Windsurf by typing the workflow name as a slash command."
