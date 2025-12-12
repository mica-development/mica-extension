# Publishing the Mica VS Code Extension

This guide walks you through publishing the Mica extension to the Visual Studio Code Marketplace.

## Prerequisites

- A GitHub account (you already have this)
- A Microsoft account (create at https://account.microsoft.com if needed)
- Node.js and npm installed

## Step-by-Step Publishing Guide

### Step 1: Install vsce (Visual Studio Code Extension Manager)

```bash
npm install -g @vscode/vsce
```

This tool packages and publishes VS Code extensions.

### Step 2: Create an Azure DevOps Organization

1. Go to https://dev.azure.com
2. Sign in with your Microsoft account
3. Click "New organization" if you don't have one
4. Name it (e.g., "mica-development" or your preferred name)
5. Complete the setup

### Step 3: Create a Personal Access Token (PAT)

1. In Azure DevOps, click your profile icon (top right)
2. Select "Personal access tokens"
3. Click "+ New Token"
4. Configure the token:
   - **Name**: "vscode-marketplace" (or any descriptive name)
   - **Organization**: Select your organization
   - **Expiration**: Choose duration (90 days recommended for security)
   - **Scopes**: Select "Custom defined"
     - Click "Show all scopes"
     - Check **"Marketplace" → "Manage"** (this is critical!)
5. Click "Create"
6. **IMPORTANT**: Copy the token immediately and save it securely
   - You won't be able to see it again!
   - Store it in a password manager

### Step 4: Create a Publisher

A publisher is your identity in the marketplace. You already have "mica-development" in package.json.

**Option A: Create via Command Line**
```bash
vsce create-publisher mica-development
```
Follow prompts:
- Personal Access Token: [paste your PAT]
- Publisher Name: mica-development (must match package.json)
- Display Name: Mica Development
- Email: your-email@example.com

**Option B: Create via Web**
1. Go to https://marketplace.visualstudio.com/manage
2. Sign in with the same Microsoft account
3. Click "Create publisher"
4. Fill in:
   - **ID**: mica-development (must match package.json)
   - **Name**: Mica Development
   - **Email**: your email
5. Click "Create"

### Step 5: Login with vsce

```bash
vsce login mica-development
```

Enter your Personal Access Token when prompted.

### Step 6: Package Your Extension (Optional but Recommended)

Test packaging before publishing:

```bash
cd /home/michael/Source/Repos/mica-extension
vsce package
```

This creates a `.vsix` file (e.g., `mica-language-2.0.0.vsix`).

**Test the package locally:**
```bash
code --install-extension mica-language-2.0.0.vsix
```

### Step 7: Publish to Marketplace

When ready to publish:

```bash
vsce publish
```

Or specify a version bump:
```bash
vsce publish patch  # 2.0.0 → 2.0.1
vsce publish minor  # 2.0.0 → 2.1.0
vsce publish major  # 2.0.0 → 3.0.0
```

The tool will:
1. Validate your extension
2. Package it
3. Upload to the marketplace
4. Publish it

### Step 8: Verify Publication

1. Go to https://marketplace.visualstudio.com/manage/publishers/mica-development
2. You should see your extension listed
3. Public page: https://marketplace.visualstudio.com/items?itemName=mica-development.mica-language

**Note**: It may take a few minutes for the extension to appear in VS Code's extension search.

## Updating Your Extension

When you make changes:

1. Update version in `package.json`
2. Update `README.md` with changes
3. Commit changes to git
4. Run: `vsce publish`

Or let vsce bump the version:
```bash
vsce publish minor
```

## Unpublishing (if needed)

To remove an extension version:
```bash
vsce unpublish mica-development.mica-language@2.0.0
```

To unpublish entirely:
```bash
vsce unpublish mica-development.mica-language
```

**Warning**: Unpublishing removes the extension for all users!

## Troubleshooting

### "Publisher 'mica-development' not found"
- Create the publisher first (Step 4)
- Ensure publisher ID matches exactly

### "PAT is not valid"
- Generate a new token with "Marketplace → Manage" scope
- Use `vsce login mica-development` again

### "package.json not found"
- Run commands from extension root directory

### "No README found"
- You have one, so this shouldn't happen
- If it does, ensure README.md is in root

## Best Practices

1. **Version Control**: Always commit changes before publishing
2. **Changelog**: Keep README.md updated with version changes
3. **Testing**: Test `.vsix` package locally before publishing
4. **Semantic Versioning**: Use proper version numbers (MAJOR.MINOR.PATCH)
5. **Security**: Never commit your PAT to git
6. **Regular Updates**: Keep extension updated with VS Code API changes

## Quick Reference Commands

```bash
# Install vsce
npm install -g @vscode/vsce

# Login
vsce login mica-development

# Package (test)
vsce package

# Publish
vsce publish

# Publish with version bump
vsce publish patch|minor|major

# List published versions
vsce show mica-development.mica-language
```

## Resources

- VS Code Publishing Guide: https://code.visualstudio.com/api/working-with-extensions/publishing-extension
- Marketplace Management: https://marketplace.visualstudio.com/manage
- Azure DevOps: https://dev.azure.com

---

**Ready to publish?** Start with Step 1 and follow the guide!
