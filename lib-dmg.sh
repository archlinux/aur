#!/bin/bash
# DMG/.app discovery and metadata extraction. Sourced by install.sh.

resolve_input_path() {
    local explicit_path="$1"
    local -a candidates=()

    if [ -n "$explicit_path" ]; then
        [ -e "$explicit_path" ] || error "Input not found: $explicit_path"
        realpath "$explicit_path"
        return 0
    fi

    if [ -d "$SCRIPT_DIR/downloads" ]; then
        mapfile -d '' candidates < <(find "$SCRIPT_DIR/downloads" -maxdepth 1 -type f -name "*.dmg" -print0 | sort -z)
        if [ "${#candidates[@]}" -eq 1 ]; then
            realpath "${candidates[0]}"
            return 0
        fi
        if [ "${#candidates[@]}" -gt 1 ]; then
            error "Multiple DMGs found in downloads/. Pass one explicitly."
        fi
    fi

    if [ -d "$SCRIPT_DIR/build/app-extracted" ]; then
        mapfile -d '' candidates < <(find "$SCRIPT_DIR/build/app-extracted" -maxdepth 4 -name "*.app" -type d -print0 | sort -z)
        if [ "${#candidates[@]}" -eq 1 ]; then
            warn "No DMG found in downloads/; using already extracted app fallback"
            realpath "${candidates[0]}"
            return 0
        fi
    fi

    error "No input found. Pass a DMG/.app path or place one official DMG in downloads/."
}

resolve_app_bundle() {
    local input_path="$1"
    local seven_zip_cmd extract_dir seven_log app_bundle status

    if [ -d "$input_path" ] && [[ "$input_path" == *.app ]]; then
        echo "$input_path"
        return 0
    fi

    [ -f "$input_path" ] || error "Input is not a file or .app directory: $input_path"
    seven_zip_cmd="$(find_7z)"
    extract_dir="$WORK_DIR/dmg-extract"
    seven_log="$WORK_DIR/7z.log"
    mkdir -p "$extract_dir"

    info "Extracting DMG with $(basename "$seven_zip_cmd")"
    status=0
    "$seven_zip_cmd" x -y -snl "$input_path" -o"$extract_dir" >"$seven_log" 2>&1 || status=$?

    app_bundle="$(find "$extract_dir" -maxdepth 5 -name "*.app" -type d | sort | head -n 1)"
    if [ "$status" -ne 0 ] && [ -z "$app_bundle" ]; then
        cat "$seven_log" >&2
        error "Failed to extract DMG"
    fi
    [ -n "$app_bundle" ] || error "Could not find .app bundle in DMG"

    echo "$app_bundle"
}

detect_electron_version() {
    local app_bundle="$1"
    local plist="$app_bundle/Contents/Frameworks/Electron Framework.framework/Versions/A/Resources/Info.plist"
    local detected

    if [ -f "$plist" ]; then
        detected="$(python3 - "$plist" <<'PY'
import plistlib
import sys

with open(sys.argv[1], "rb") as handle:
    print(plistlib.load(handle).get("CFBundleVersion", ""))
PY
)"
        if [[ "$detected" =~ ^[0-9]+(\.[0-9]+){2}([.-][0-9A-Za-z]+)*$ ]]; then
            echo "$detected"
            return 0
        fi
    fi

    local package_json="$app_bundle/Contents/Resources/app/package.json"
    if [ -f "$package_json" ]; then
        detected="$(node -e 'const p=require(process.argv[1]); process.stdout.write(String(p.devDependencies?.electron || p.dependencies?.electron || ""));' "$package_json")"
        detected="${detected#^}"
        detected="${detected#~}"
        detected="${detected#v}"
        if [[ "$detected" =~ ^[0-9]+(\.[0-9]+){2}([.-][0-9A-Za-z]+)*$ ]]; then
            echo "$detected"
            return 0
        fi
    fi

    echo "$ELECTRON_VERSION"
}

read_app_version() {
    local app_bundle="$1"
    local plist="$app_bundle/Contents/Info.plist"

    if [ -f "$plist" ]; then
        python3 - "$plist" <<'PY'
import plistlib
import sys

with open(sys.argv[1], "rb") as handle:
    data = plistlib.load(handle)
print(data.get("CFBundleShortVersionString") or data.get("CFBundleVersion") or "")
PY
        return 0
    fi

    echo ""
}
