#!/bin/bash

# install Mica language extension for VS Code
echo "Installing or updating Mica language extension"

# detect the correct VS Code extensions directory
if [ -d "$HOME/.vscode/extensions" ]; then
    EXTENSION_BASE="$HOME/.vscode/extensions"
elif [ -d "$HOME/.vscode-server/extensions" ]; then
    EXTENSION_BASE="$HOME/.vscode-server/extensions"
elif [ -d "$HOME/.vscode-remote/extensions" ]; then
    EXTENSION_BASE="$HOME/.vscode-remote/extensions"
elif [ -d "$HOME/.vscode-server-insiders/extensions" ]; then
    EXTENSION_BASE="$HOME/.vscode-server-insiders/extensions"
elif [ -d "$HOME/.vscode-insiders/extensions" ]; then
    EXTENSION_BASE="$HOME/.vscode-insiders/extensions"
else
    echo "Error: Could not find VS Code extensions directory"
    echo "Searched in:"
    echo "  - $HOME/.vscode/extensions"
    echo "  - $HOME/.vscode-server/extensions"
    echo "  - $HOME/.vscode-remote/extensions"
    echo "  - $HOME/.vscode-server-insiders/extensions"
    echo "  - $HOME/.vscode-insiders/extensions"
    exit 1
fi

EXTENSION_DIR="$EXTENSION_BASE/mica-language"
echo "Found VS Code extensions directory: $EXTENSION_BASE"

# remove old version if exists
if [ -d "$EXTENSION_DIR" ]; then
    echo "Removing existing Mica extension"
    rm -rf "$EXTENSION_DIR"
    echo "✗ Mica extension removed from: $EXTENSION_DIR"
fi

# create extension directory for the Mica language
mkdir --parents "$EXTENSION_DIR"

# copy extension to VS Code extensions directory
echo "Installing Mica extension"
cp --recursive .vscode/extensions/mica-language/* "$EXTENSION_DIR"

# verify installation
if [ -d "$EXTENSION_DIR" ]; then
    echo "✓ Mica extension installed successfully to: $EXTENSION_DIR"
    echo ""
    echo "Files installed:"
    find "$EXTENSION_DIR" -type f -name "*.*" | sort
    echo ""
    echo "Please reload VS Code window: press Ctrl+Shift+P (or Cmd+Shift+P) and run 'Developer: Reload Window'"
else
    echo "Error: Installation failed"
    exit 1
fi