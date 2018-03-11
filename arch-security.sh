 #!/bin/bash

 # Print help message
function help {
    printf 'arch-security by default checks after every package update/install/removal the security tracker of ArchLinux at https://security.archlinux.org and compares it with installed packages.\n'
    printf 'For each of that package it can display currently known CVE entries as well as explanations for them.\n'
    printf 'On top you can scan your system for some default security configurations as described on https://wiki.archlinux.org/index.php/security.\n'
    printf 'Please keep in mind that these advises do not guarantee security and are based on personal experiences.\n'
    printf 'Usage:\n'
    printf '\tarch-security [-h|--help] [-v|--vulnerabilities] [-p|--package <Package_Name>] [-c|--cve <CVE-XXXX-XXXX>] [-s|--scan] [-q|--quiet]\n\n'
    printf 'Arguments:\n'
    printf '\t-h, --help\t\t\tshow this help message and exit\n'
    printf '\t-v, --vulnerabilities\t\tDisplay current package vulnerabilities\n'
    printf '\t-p, --package <Package>\t\tDisplay known CVEs for specific package\n'
    printf '\t-c, --cve <CVE-XXXX-XXXX>\tDisplay informations about specific CVE\n'
    printf '\t-s, --scan\t\t\tDisplay possible security issues\n'
    printf '\t-q, --quiet\t\t\tDisplay short outputs only\n'
    printf '\tdefaults: --vulnerabilities --quiet\n'
}

# If no arguments given call the script
if [[ -z "$@" ]]; then
    /opt/arch-security/env/bin/python3 /opt/arch-security/arch-security.py
fi

# Otherwise loop over the arguments
for arg in "$@"
do
    if [[ "$arg" == '--help' ]] || [[ "$arg" == '-h' ]]; then
        help
        exit 0
    else
        /opt/arch-security/env/bin/python3 /opt/arch-security/arch-security.py $@
        exit 0
    fi
done
