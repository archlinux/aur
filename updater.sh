#!/usr/bin/env bash

set -Eeuo pipefail

readonly GITHUB_API_URL="https://api.github.com/repos/Voxelum/x-minecraft-launcher/releases/latest"
readonly PKGBUILD_FILE="PKGBUILD"
readonly SRCINFO_FILE=".SRCINFO"

readonly HTTP_TIMEOUT=15
readonly BUILD_TIMEOUT=600
readonly USER_AGENT="xmcl-package-updater/2.0"

# Colors
if [[ -t 1 ]]; then
    readonly COLOR_RESET=$'\033[0m'
    readonly COLOR_RED=$'\033[91m'
    readonly COLOR_GREEN=$'\033[92m'
    readonly COLOR_YELLOW=$'\033[93m'
    readonly COLOR_BLUE=$'\033[94m'
else
    readonly COLOR_RESET=""
    readonly COLOR_RED=""
    readonly COLOR_GREEN=""
    readonly COLOR_YELLOW=""
    readonly COLOR_BLUE=""
fi

BUILD_PID=""
BUILD_WATCHDOG_PID=""
CANCELLED=false

log_success() {
    printf '%s✓ %s%s\n' "$COLOR_GREEN" "$*" "$COLOR_RESET"
}

log_error() {
    printf '%s✗ %s%s\n' "$COLOR_RED" "$*" "$COLOR_RESET" >&2
}

log_info() {
    printf '%sℹ %s%s\n' "$COLOR_YELLOW" "$*" "$COLOR_RESET"
}

log_action() {
    printf '%s→ %s%s\n' "$COLOR_BLUE" "$*" "$COLOR_RESET"
}

die() {
    log_error "$*"
    exit 1
}

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

validate_environment() {
    [[ -f "$PKGBUILD_FILE" ]] ||
        die "$PKGBUILD_FILE not found in current directory"

    local command_name

    for command_name in curl updpkgsums makepkg; do
        command_exists "$command_name" ||
            die "required command '$command_name' not found in PATH"
    done
}

get_latest_version() {
    local response
    local tag_name

    if ! response="$(
        curl \
            --fail \
            --silent \
            --show-error \
            --location \
            --connect-timeout "$HTTP_TIMEOUT" \
            --max-time "$HTTP_TIMEOUT" \
            --header "User-Agent: $USER_AGENT" \
            "$GITHUB_API_URL"
    )"; then
        die "fetching latest release failed"
    fi

    # GitHub tag names normally contain plain version strings, so this avoids
    # adding jq as an extra dependency.
    if [[ $response =~ \"tag_name\"[[:space:]]*:[[:space:]]*\"([^\"]+)\" ]]; then
        tag_name="${BASH_REMATCH[1]}"
    else
        die "fetching latest release: no tag_name in API response"
    fi

    printf '%s\n' "$tag_name"
}

update_pkgbuild_version() {
    local version="$1"
    local version_number="${version#v}"
    local line
    local found_pkgver=false
    local found_pkgrel=false
    local temporary_file

    temporary_file="$(mktemp "${PKGBUILD_FILE}.XXXXXX")" ||
        die "could not create temporary file"

    while IFS= read -r line || [[ -n $line ]]; do
        if [[ $line =~ ^[[:space:]]*pkgver= ]]; then
            printf 'pkgver=%s\n' "$version_number" >>"$temporary_file"
            found_pkgver=true
        elif [[ $line =~ ^[[:space:]]*pkgrel= ]]; then
            printf 'pkgrel=1\n' >>"$temporary_file"
            found_pkgrel=true
        else
            printf '%s\n' "$line" >>"$temporary_file"
        fi
    done <"$PKGBUILD_FILE"

    if [[ $found_pkgver != true ]]; then
        rm -f "$temporary_file"
        die "pkgver entry not found in $PKGBUILD_FILE"
    fi

    if [[ $found_pkgrel != true ]]; then
        rm -f "$temporary_file"
        die "pkgrel entry not found in $PKGBUILD_FILE"
    fi

    chmod --reference="$PKGBUILD_FILE" "$temporary_file" 2>/dev/null || true

    if ! mv -- "$temporary_file" "$PKGBUILD_FILE"; then
        rm -f "$temporary_file"
        die "writing file $PKGBUILD_FILE failed"
    fi
}

update_checksums() {
    updpkgsums ||
        die "updpkgsums failed"
}

update_srcinfo() {
    local temporary_file

    temporary_file="$(mktemp "${SRCINFO_FILE}.XXXXXX")" ||
        die "could not create temporary .SRCINFO file"

    if ! makepkg --printsrcinfo >"$temporary_file"; then
        rm -f "$temporary_file"
        die "generating $SRCINFO_FILE failed"
    fi

    if ! mv -- "$temporary_file" "$SRCINFO_FILE"; then
        rm -f "$temporary_file"
        die "writing file $SRCINFO_FILE failed"
    fi
}

kill_build() {
    if [[ -n $BUILD_WATCHDOG_PID ]]; then
        kill "$BUILD_WATCHDOG_PID" 2>/dev/null || true
        wait "$BUILD_WATCHDOG_PID" 2>/dev/null || true
        BUILD_WATCHDOG_PID=""
    fi

    if [[ -n $BUILD_PID ]] && kill -0 "$BUILD_PID" 2>/dev/null; then
        kill -TERM "$BUILD_PID" 2>/dev/null || true

        # Give makepkg a moment to terminate cleanly.
        local attempt
        for ((attempt = 0; attempt < 20; attempt++)); do
            kill -0 "$BUILD_PID" 2>/dev/null || break
            sleep 0.1
        done

        if kill -0 "$BUILD_PID" 2>/dev/null; then
            kill -KILL "$BUILD_PID" 2>/dev/null || true
        fi
    fi
}

build_package() {
    local timeout="$1"
    local exit_code
    local timeout_marker

    timeout_marker="$(mktemp)" ||
        die "could not create build timeout marker"

    rm -f "$timeout_marker"

    makepkg -s &
    BUILD_PID=$!

    (
        sleep "$timeout"

        if kill -0 "$BUILD_PID" 2>/dev/null; then
            : >"$timeout_marker"
            kill -TERM "$BUILD_PID" 2>/dev/null || true

            sleep 2

            if kill -0 "$BUILD_PID" 2>/dev/null; then
                kill -KILL "$BUILD_PID" 2>/dev/null || true
            fi
        fi
    ) &

    BUILD_WATCHDOG_PID=$!

    set +e
    wait "$BUILD_PID"
    exit_code=$?
    set -e

    kill "$BUILD_WATCHDOG_PID" 2>/dev/null || true
    wait "$BUILD_WATCHDOG_PID" 2>/dev/null || true

    BUILD_PID=""
    BUILD_WATCHDOG_PID=""

    if [[ -e $timeout_marker ]]; then
        rm -f "$timeout_marker"
        die "build timeout"
    fi

    rm -f "$timeout_marker"

    if ((exit_code != 0)); then
        die "makepkg failed with exit code $exit_code"
    fi
}

confirm_build() {
    local answer=""

    if [[ $CANCELLED == true ]]; then
        return 1
    fi

    if [[ ! -t 0 ]]; then
        log_info "No interactive terminal available; skipping package build"
        return 1
    fi

    read -r -p "Build package now? [y/N]: " answer || true
    answer="${answer,,}"

    [[ $answer == "y" || $answer == "yes" ]]
}

handle_interrupt() {
    trap - INT TERM

    CANCELLED=true
    printf '\n'
    log_info "Interrupt received, cancelling..."

    kill_build
    exit 1
}

cleanup() {
    local exit_code=$?

    if [[ -n $BUILD_PID ]] || [[ -n $BUILD_WATCHDOG_PID ]]; then
        kill_build
    fi

    return "$exit_code"
}

main() {
    local version

    validate_environment

    log_action "Fetching latest version from GitHub..."
    version="$(get_latest_version)"

    log_info "Latest version: $version"

    log_action "Updating PKGBUILD..."
    update_pkgbuild_version "$version"

    log_action "Updating checksums..."
    update_checksums

    log_action "Updating .SRCINFO..."
    update_srcinfo

    log_success "Package files updated to version $version"

    if ! confirm_build; then
        log_info "Skipping package build"
        return 0
    fi

    log_action "Building package..."
    build_package "$BUILD_TIMEOUT"

    log_success "Package built successfully!"
}

trap handle_interrupt INT TERM
trap cleanup EXIT

main "$@"
