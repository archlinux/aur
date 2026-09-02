#!/usr/bin/env bash

function retrieve_latest_git_version() {
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

    echo "${COMMIT_HASH:0:7}"
}

NEW_VERSION=$(nvchecker -c ./.nvchecker.toml --logger json | jq -r 'select(.event == "updated") | .version')
OLD_VERSION=$(grep -E '^\s*pkgver=' ./PKGBUILD | sed -E 's/pkgver=["'\'' ]*([^"'\'' ]*).*/\1/')
MAJOR_VERSION_UPGRADE=$([ "${NEW_VERSION}" != "${OLD_VERSION}" ] && echo true || echo false)

NEW_GIT_VERSION=$(retrieve_latest_git_version)
OLD_GIT_VERSION=$(grep -E '^\s*_gitversion=' ./PKGBUILD | sed -E 's/_gitversion=(.*)/\1/')
MINOR_VERSION_UPGRADE=$([ "${NEW_GIT_VERSION}" != "${OLD_GIT_VERSION}" ] && echo true || echo false)

if [ "${MAJOR_VERSION_UPGRADE}" == "true" ] || [ "${MINOR_VERSION_UPGRADE}" == "true" ]; then
    sed -i "s/^[[:space:]]*_gitversion=.*/_gitversion=${NEW_GIT_VERSION}/" ./PKGBUILD

    if [ "${MINOR_VERSION_UPGRADE}" == "true" ]; then
        NEW_PKGVER=${NEW_VERSION}

        CURRENT_PKGREL=$(grep -E '^\s*pkgrel=' ./PKGBUILD | sed -E 's/pkgrel=["'\'' ]*([^"'\'' ]*).*/\1/')
        NEW_PKGREL=$((CURRENT_PKGREL + 1))

        sed -i "s/^[[:space:]]*pkgver=.*/pkgver=${NEW_PKGVER}/" ./PKGBUILD
        sed -i "s/^[[:space:]]*pkgrel=.*/pkgrel=${NEW_PKGREL}/" ./PKGBUILD
    fi

    if [ "${MAJOR_VERSION_UPGRADE}" == "true" ]; then
        NEW_PKGVER=${NEW_VERSION}
        NEW_PKGREL=$((1))

        sed -i "s/^[[:space:]]*pkgver=.*/pkgver=${NEW_PKGVER}/" ./PKGBUILD
        sed -i "s/^[[:space:]]*pkgrel=.*/pkgrel=${NEW_PKGREL}/" ./PKGBUILD
    fi

    updpkgsums && makepkg -o && makepkg --printsrcinfo > .SRCINFO

    echo -e "\nNew version: $(grep -E '^\s*pkgver=' ./PKGBUILD | sed -E 's/pkgver=["'\'' ]*([^"'\'' ]*).*/\1/') !"
else
    echo -e "\nAlready updated!"
fi
