#!/bin/bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  zipkg -i <package>   Install package from AUR"
    echo "  zipkg -r <package>   Remove package"
    exit 1
}

func_main() {
    [[ $# -lt 2 ]] && usage

    action="$1"
    package="$2"

    [[ -z "$package" ]] && {
        echo "Error: Package name cannot be empty."
        exit 1
    }

    case "$action" in
        -i)
            if [ -d "$package" ]; then
                echo "Warning: Directory $package already exists. Removing it."
                sudo rm -rf "$package" || {
                    echo "Error: Failed to remove existing directory $package."
                    exit 1
                }
            fi

            git clone "https://aur.archlinux.org/$package.git" "$package" || {
                echo "Error: Failed to clone the repository."
                exit 1
            }

            (
                cd "$package" || exit 1
                makepkg -si || {
                    echo "Error: Failed to build or install the package."
                    exit 1
                }
            )

            rm -rf "$package" || {
                echo "Error: Failed to remove $package directory."
                exit 1
            }
            ;;
        -r)
            sudo pacman -Rns "$package" || {
                echo "Error: Failed to remove package $package."
                exit 1
            }
            ;;
        *)
            usage
            ;;
    esac
}

func_main "$@"
