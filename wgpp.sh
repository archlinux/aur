#!/usr/bin/env bash
# script: wg++ (WebGrab+Plus)
# author: Nikos Toutountzoglou, nikos.toutou@protonmail.com
# rev.date: 2026-08-18

VERSION="5.6.0"

# Variables
WGPP_USR=$(whoami)
WGPP_EXE=$(basename "$0")
WGPP_USR_HOME=$(getent passwd "$WGPP_USR" | cut -d: -f6)
WGPP_CFGDIR="$WGPP_USR_HOME/wg++"
WGPP_SYS="/usr/share/wg++"

# Functions
helpMsg() {
    # Display help message
    cat <<EOF
WebGrab+Plus EPG/XMLTV Grabber v${VERSION}
Usage: $WGPP_EXE [options]

Options:
  -d, --dir <CUSTOM_DIR>   Run from custom configuration folder <CUSTOM_DIR>.
  -g, --generate           Create new configuration folder 'wg++' in user's home directory.
  -h, --help               Show this help message.

Examples:
  $WGPP_EXE                       Run using the default configuration directory ($WGPP_USR_HOME/wg++).
  $WGPP_EXE -d <CUSTOM_DIR>       Run using a custom configuration directory.
  $WGPP_EXE -d <CUSTOM_DIR> -g    Create a custom configuration folder.

Note: SiteIni.Pack updates are now handled automatically by the dotnet binaries.

EOF
    exit 0
}

checkReq() {
    # Ensure required packages are installed
    local packages=(dotnet-runtime-9.0 libxml2 wget unzip sudo)
    local missing=()
    
    for p in "${packages[@]}"; do
        if ! pacman -Qs "$p" >/dev/null 2>&1; then
            missing+=("$p")
        fi
    done
    
    if [[ ${#missing[@]} -gt 0 ]]; then
        printf "[ critical ] Required package(s) not installed: %s\n" "$(IFS=", "; echo "${missing[*]}")"
        printf "[ info ] Please install with: sudo pacman -S %s\n" "${missing[*]}"
        exit 1
    fi
}

missingSysFiles() {
    # Restore missing system files if needed
    if [[ ! -e "$WGPP_CFGDIR/install.sh" || ! -e "$WGPP_CFGDIR/run.net.sh" ]]; then
        printf "[ info ] Restoring missing script files...\n"
        if ! cp -r -u "$WGPP_SYS"/* "$WGPP_CFGDIR" 2>/dev/null; then
            printf "[ critical ] Failed to restore system files to '%s'\n" "$WGPP_CFGDIR"
            exit 1
        fi
        printf "[ info ] Restored missing script files 'install.sh' and/or 'run.net.sh'.\n"
    fi
}

checkWGPPDir() {
    # Check if the working directory exists
    if [[ ! -d "$WGPP_CFGDIR" ]]; then
        return 1
    fi
    return 0
}

setupCustFolder() {
    if [[ -z "$cust_dir" ]]; then
        printf "[ critical ] Empty custom directory input. Please specify a valid directory.\n" >&2
        exit 1
    fi

    # Resolve the absolute path of the custom directory
    WGPP_CFGDIR=$(realpath "$cust_dir" 2>/dev/null || echo "$cust_dir")

    # Create the directory if it doesn't exist
    if [[ ! -d "$WGPP_CFGDIR" ]]; then
        printf "[ info ] Directory '%s' does not exist. Creating it now...\n" "$WGPP_CFGDIR"
        if ! mkdir -p "$WGPP_CFGDIR"; then
            printf "[ critical ] Failed to create directory '%s'. Please check permissions.\n" "$WGPP_CFGDIR" >&2
            exit 1
        fi
    fi

    printf "[ info ] Using configuration directory: '%s'\n" "$WGPP_CFGDIR"
}

genFolder() {
    # Create a configuration folder if it doesn't exist.
    # A folder is considered "already configured" only when it holds the
    # install.sh marker (i.e. install.sh or WebGrab++.config.xml present).
    if [[ -d "$WGPP_CFGDIR" && -f "$WGPP_CFGDIR/WebGrab++.config.xml" ]]; then
        printf "[ info ] Configuration folder '%s' already exists.\n" "$WGPP_CFGDIR"
        printf "[ info ] Use a different directory or delete the existing one first.\n"
        exit 1
    fi

    # Populate the configuration folder (create it if missing, or fill an
    # empty one -- e.g. one just created by -d/--dir)
    if [[ ! -d "$WGPP_CFGDIR" ]]; then
        printf "[ info ] Creating new configuration folder '%s'...\n" "$WGPP_CFGDIR"
        if ! cp -r "$WGPP_SYS" "$WGPP_CFGDIR"; then
            printf "[ critical ] Failed to copy system files to '%s'\n" "$WGPP_CFGDIR"
            exit 1
        fi
    else
        printf "[ info ] Populating configuration folder '%s'...\n" "$WGPP_CFGDIR"
        if ! cp -r "$WGPP_SYS"/. "$WGPP_CFGDIR"; then
            printf "[ critical ] Failed to copy system files to '%s'\n" "$WGPP_CFGDIR"
            exit 1
        fi
    fi

    cd "$WGPP_CFGDIR" || {
        printf "[ critical ] Cannot access '%s' directory\n" "$WGPP_CFGDIR"
        exit 1
    }
    
    if ! sudo -u "$WGPP_USR" ./install.sh; then
        printf "[ critical ] Installation script failed\n"
        exit 1
    fi
    
    printf "[ info ] Configuration folder '%s' created successfully.\n" "$WGPP_CFGDIR"
    printf "[ info ] Configure 'WebGrab++.config.xml' and run '%s' to generate EPG data.\n" "$WGPP_EXE"
    printf "[ info ] SiteIni.Pack updates are now handled automatically by the application.\n"
    exit 0
}

runScript() {
    # Execute the main script and ensure output XML is formatted
    cd "$WGPP_CFGDIR" || {
        printf "[ critical ] Cannot access '%s' directory\n" "$WGPP_CFGDIR"
        exit 1
    }
    
    printf "[ info ] Running WebGrab++ from '%s'...\n" "$WGPP_CFGDIR"
    printf "[ info ] SiteIni.Pack updates will be handled automatically if needed.\n"
    
    # Create temporary file for capturing output
    local tmp_output
    tmp_output=$(mktemp)
    
    # Run the script and capture output
    if ! sudo -u "$WGPP_USR" ./run.net.sh 2>&1 | tee "$tmp_output"; then
        printf "[ critical ] WebGrab++ execution failed\n"
        rm -f "$tmp_output"
        exit 1
    fi
    
    # Check for license-related errors in the output
    if grep -q "Index was outside the bounds of the array" "$tmp_output" || \
       grep -q "Unhandled Exception" "$tmp_output" && \
       grep -q "WGLicense.log.txt" "$tmp_output"; then
        printf "\n[ critical ] WebGrab++ license validation failed\n"
        printf "[ info ] This error typically occurs when no valid license is found or when your license has expired.\n"
        printf "[ info ] Please check the license file in '%s' and ensure it's valid.\n" "$WGPP_CFGDIR"
        
        # If the log file exists, extract relevant license information
        if [[ -f "$WGPP_CFGDIR/WGLicense.log.txt" ]]; then
            printf "\n[ info ] License log information:\n"
            grep -i "license\|exception\|error" "$WGPP_CFGDIR/WGLicense.log.txt" | head -10
            printf "\n[ info ] For full details, see: %s/WGLicense.log.txt\n" "$WGPP_CFGDIR"
        fi
        
        printf "\n[ info ] To obtain a license, visit: https://webgrabplus.com/faq\n"
        rm -f "$tmp_output"
        exit 1
    fi
    
    # Clean up temporary file
    rm -f "$tmp_output"

    if [[ ! -e "$WGPP_CFGDIR/latest.xml" ]]; then
        printf "[ critical ] Missing EPG XML data file 'latest.xml'. Check configuration and logs.\n"
        exit 1
    fi
    
    printf "[ info ] Formatting XML output...\n"
    if ! xmllint --format latest.xml > guide.xml 2>/dev/null; then
        printf "[ warning ] xmllint formatting failed, using unformatted XML\n"
        cp latest.xml guide.xml
    fi
    
    printf "[ info ] EPG data successfully saved as 'guide.xml'.\n"
    exit 0
}

# Argument Parsing
cust_dir=""
do_generate=0

while [[ $# -gt 0 ]]; do
    case "$1" in
    -d | --dir)
        if [[ -n "$cust_dir" ]]; then
            printf "[ critical ] The '-d|--dir' option is specified more than once\n" >&2
            exit 1
        fi
        shift
        if [[ $# -eq 0 || "$1" == -* ]]; then
            printf "[ critical ] The '-d|--dir' option requires a directory path argument\n" >&2
            exit 1
        fi
        cust_dir="$1"
        setupCustFolder
        ;;
    -g | --generate)
        do_generate=1
        ;;
    -u | --update)
        printf "[ info ] The '--update' option is no longer needed in v${VERSION}.\n"
        printf "[ info ] SiteIni.Pack updates are now handled automatically by the dotnet binaries.\n"
        printf "[ info ] Simply run the application normally and updates will be managed automatically.\n"
        exit 0
        ;;
    -h | --help)
        helpMsg
        ;;
    *)
        printf "[ critical ] Unknown argument '%s'\n" "$1" >&2
        printf "[ info ] Use '%s --help' for usage information\n" "$WGPP_EXE" >&2
        exit 1
        ;;
    esac
    shift
done

# Main Execution
checkReq

if [[ $do_generate -eq 1 ]]; then
    genFolder
else
    # Default execution path (no arguments)
    if ! checkWGPPDir; then
        printf "[ info ] No configuration directory found at '%s'\n" "$WGPP_CFGDIR"
        printf "[ info ] Use '%s --generate' to create a new configuration directory\n" "$WGPP_EXE"
        helpMsg
    fi
    # Directory exists, proceed with normal execution
    missingSysFiles
    runScript
fi

# Script should not reach here, but exit cleanly if it does
exit 0
