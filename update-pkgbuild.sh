#!/bin/bash
# Script to update PKGBUILD with latest doudou Linux build from GitLab

set -e

GITLAB_PROJECT="Openlyst%2Fdoudou"
GITLAB_API="https://gitlab.com/api/v4"
PKGBUILD_FILE="$(dirname "$0")/PKGBUILD"

echo "Fetching latest version from pubspec.yaml..."
PUBSPEC_VERSION=$(curl -sL "https://gitlab.com/Openlyst/doudou/-/raw/main/pubspec.yaml" | grep '^version:' | sed 's/version: //g' | cut -d'+' -f1 | tr -d ' ')

if [ -z "$PUBSPEC_VERSION" ]; then
    echo "Error: Could not fetch version from pubspec.yaml"
    exit 1
fi

echo "Latest version from pubspec: $PUBSPEC_VERSION"

echo "Fetching latest successful pipelines..."
# Get successful pipelines from main branch
PIPELINES=$(curl -sL "${GITLAB_API}/projects/${GITLAB_PROJECT}/pipelines?status=success&ref=main&per_page=20")

if [ -z "$PIPELINES" ] || [ "$PIPELINES" = "[]" ]; then
    echo "Error: Could not fetch pipelines"
    exit 1
fi

# Find pipeline with successful build_release_linux job
JOB_ID=""
JOB_VERSION=""

for PIPELINE_ID in $(echo "$PIPELINES" | grep -o '"id":[0-9]*' | head -10 | sed 's/"id"://g'); do
    echo "Checking pipeline $PIPELINE_ID for build_release_linux job..."
    
    JOBS=$(curl -sL "${GITLAB_API}/projects/${GITLAB_PROJECT}/pipelines/${PIPELINE_ID}/jobs?per_page=50")
    
    # Find build_release_linux job that succeeded
    JOB_INFO=$(echo "$JOBS" | grep -o '{[^}]*"name":"build_release_linux"[^}]*}' | head -1)
    
    if [ -n "$JOB_INFO" ]; then
        STATUS=$(echo "$JOB_INFO" | grep -o '"status":"[^"]*"' | sed 's/"status":"//;s/"//')
        
        if [ "$STATUS" = "success" ]; then
            JOB_ID=$(echo "$JOB_INFO" | grep -o '"id":[0-9]*' | head -1 | sed 's/"id"://')
            echo "Found successful build_release_linux job: $JOB_ID"
            break
        fi
    fi
done

if [ -z "$JOB_ID" ]; then
    echo "Error: Could not find a successful build_release_linux job"
    exit 1
fi

echo "Using job ID: $JOB_ID"

# Get current pkgver from PKGBUILD
CURRENT_PKGVER=$(grep '^pkgver=' "$PKGBUILD_FILE" | cut -d'=' -f2)
CURRENT_PKGREL=$(grep '^pkgrel=' "$PKGBUILD_FILE" | cut -d'=' -f2)

echo "Current PKGBUILD: pkgver=$CURRENT_PKGVER, pkgrel=$CURRENT_PKGREL"

# Determine new pkgrel
if [ "$CURRENT_PKGVER" = "$PUBSPEC_VERSION" ]; then
    NEW_PKGREL=$((CURRENT_PKGREL + 1))
    echo "Same version, incrementing pkgrel to $NEW_PKGREL"
else
    NEW_PKGREL=1
    echo "New version, resetting pkgrel to 1"
fi

# Build the new source URL
NEW_SOURCE_URL="https://gitlab.com/Openlyst/doudou/-/jobs/${JOB_ID}/artifacts/raw/doudou-${PUBSPEC_VERSION}-linux-x64.zip"

echo "New source URL: $NEW_SOURCE_URL"

# Verify the artifact exists
echo "Verifying artifact exists..."
HTTP_CODE=$(curl -sL -o /dev/null -w "%{http_code}" "$NEW_SOURCE_URL")

if [ "$HTTP_CODE" != "200" ] && [ "$HTTP_CODE" != "302" ]; then
    echo "Warning: Artifact URL returned HTTP $HTTP_CODE"
    echo "The artifact may not exist or may require authentication"
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Update PKGBUILD
echo "Updating PKGBUILD..."

# Update pkgver
sed -i "s/^pkgver=.*/pkgver=${PUBSPEC_VERSION}/" "$PKGBUILD_FILE"

# Update pkgrel
sed -i "s/^pkgrel=.*/pkgrel=${NEW_PKGREL}/" "$PKGBUILD_FILE"

# Update source URL (escape special characters for sed)
ESCAPED_URL=$(echo "$NEW_SOURCE_URL" | sed 's/[&/]/\\&/g')
sed -i "s|source=(\".*\.zip::[^\"]*\")|source=(\"\${pkgname}-\${pkgver}.zip::${NEW_SOURCE_URL}\")|" "$PKGBUILD_FILE"

echo ""
echo "=== PKGBUILD Updated ==="
echo "pkgver: $CURRENT_PKGVER -> $PUBSPEC_VERSION"
echo "pkgrel: $CURRENT_PKGREL -> $NEW_PKGREL"
echo "Job ID: $JOB_ID"
echo ""

# Generate .SRCINFO
echo "Generating .SRCINFO..."
cd "$(dirname "$PKGBUILD_FILE")"
makepkg --printsrcinfo > .SRCINFO

echo ".SRCINFO generated successfully!"
echo ""
echo "To test the build:"
echo "  makepkg -si"
