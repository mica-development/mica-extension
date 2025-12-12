#!/bin/bash

# Quick start script for publishing the Mica VS Code extension
# This script guides you through the publishing process

echo "================================================"
echo "  Mica Extension Publishing Quick Start"
echo "================================================"
echo ""

# Check if vsce is installed
if ! command -v vsce &> /dev/null; then
    echo "📦 vsce not found. Installing..."
    npm install -g @vscode/vsce
    if [ $? -ne 0 ]; then
        echo "❌ Failed to install vsce. Please install Node.js and npm first."
        exit 1
    fi
    echo "✅ vsce installed successfully"
else
    echo "✅ vsce is already installed"
fi

echo ""
echo "================================================"
echo "Next Steps:"
echo "================================================"
echo ""
echo "1. Create Azure DevOps account at: https://dev.azure.com"
echo "2. Create a Personal Access Token with 'Marketplace > Manage' scope"
echo "3. Create publisher 'mica-development' at: https://marketplace.visualstudio.com/manage"
echo ""
echo "Then run these commands:"
echo ""
echo "  # Login with your publisher"
echo "  vsce login mica-development"
echo ""
echo "  # Test package your extension"
echo "  vsce package"
echo ""
echo "  # Publish to marketplace"
echo "  vsce publish"
echo ""
echo "📖 See PUBLISHING.md for detailed step-by-step instructions"
echo ""
