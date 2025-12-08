#!/bin/bash

# install Mica language extension for VS Code as user extension
echo "Installing or updating Mica language extension"

# use user extensions directory
EXTENSION_DIR="$HOME/.vscode/extensions/mica-language"
echo "Installing to user extensions directory: $HOME/.vscode/extensions"

# get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# the workspace root is the parent of the scripts directory
WORKSPACE_ROOT="$(dirname "$SCRIPT_DIR")"

echo "Extension source: $WORKSPACE_ROOT"

# remove old version if exists
if [ -d "$EXTENSION_DIR" ]; then
    echo "Removing existing Mica extension"
    rm -rf "$EXTENSION_DIR"
    echo "✗ Mica extension removed from: $EXTENSION_DIR"
fi

# create extension directory for the Mica language
mkdir --parents "$EXTENSION_DIR"

# copy extension files to VS Code extensions directory
echo "Installing Mica extension"
cp "$WORKSPACE_ROOT/package.json" "$EXTENSION_DIR/"
cp "$WORKSPACE_ROOT/language-configuration.json" "$EXTENSION_DIR/"
cp "$WORKSPACE_ROOT/README.md" "$EXTENSION_DIR/"
cp "$WORKSPACE_ROOT/LICENSE" "$EXTENSION_DIR/"
cp -r "$WORKSPACE_ROOT/images" "$EXTENSION_DIR/"
cp -r "$WORKSPACE_ROOT/snippets" "$EXTENSION_DIR/"
cp -r "$WORKSPACE_ROOT/syntaxes" "$EXTENSION_DIR/"

# verify installation
if [ -d "$EXTENSION_DIR" ]; then
    echo "✓ Mica extension installed successfully to: $EXTENSION_DIR"
    echo ""
    echo "Files installed:"
    find "$EXTENSION_DIR" -type f -name "*.*" | sort
    echo ""
    echo "Please reload VS Code window: press Ctrl+Shift+P (or Cmd+Shift+P) and run 'Developer: Reload Window'"
else
    echo "Error: Installation failed, please verify your VS Code extensions directory permissions."
    exit 1
fi