#!/usr/bin/env bash

OWNER="joewalnes"
REPO="zepto"
RELEASE_TARGET="latest"

TAG_NAME=$(gh api "repos/${OWNER}/${REPO}/releases" --jq ".[] | select(.name == \"${RELEASE_TARGET}\" or .tag_name == \"${RELEASE_TARGET}\") | .tag_name" | head -n 1)

REF_DATA=$(gh api "repos/${OWNER}/${REPO}/git/ref/tags/${TAG_NAME}")

OBJ_TYPE=$(echo "$REF_DATA" | gh auth status --tag 2>/dev/null; echo "$REF_DATA" | jq -r '.object.type')
OBJ_SHA=$(echo "$REF_DATA" | jq -r '.object.sha')

if [ "$OBJ_TYPE" = "commit" ]; then
    # Lightweight tag: points directly to the commit
    COMMIT_HASH="$OBJ_SHA"
elif [ "$OBJ_TYPE" = "tag" ]; then
    # Annotated tag: points to a tag object; must look up the underlying commit
    COMMIT_HASH=$(gh api "repos/${OWNER}/${REPO}/git/tags/${OBJ_SHA}" | jq -r '.object.sha')
else
    echo "Error: Unexpected object type '${OBJ_TYPE}' for tag '${TAG_NAME}'." >&2
    exit 1
fi

NEW_GIT_VERSION="${COMMIT_HASH:0:7}"

OLD_GIT_VERSION=$(grep -E '^\s*_gitversion=' ./PKGBUILD | sed -E 's/_gitversion=(.*)/\1/')

if [ "${NEW_GIT_VERSION}" != "${OLD_GIT_VERSION}" ]; then
    sed -i "s/^[[:space:]]*_gitversion=.*/_gitversion=${NEW_GIT_VERSION}/" ./PKGBUILD

    updpkgsums && makepkg -o && makepkg --printsrcinfo > .SRCINFO

    PKGVER=$(grep -E '^\s*pkgver=' ./PKGBUILD | sed -E 's/pkgver=["'\'' ]*([^"'\'' ]*).*/\1/')

    echo -e "\nNew version: ${PKGVER} !"
else
    echo -e "\nAlready updated!"
fi
