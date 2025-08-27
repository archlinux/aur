#!/bin/bash

# AUR maintenance script for omarchy-calculator-git
# This script helps with common AUR package maintenance tasks

set -e

PACKAGE_NAME="omarchy-calculator-git"
AUR_URL="ssh://aur@aur.archlinux.org/${PACKAGE_NAME}.git"

function usage() {
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  test        - Test build the package locally"
    echo "  update      - Update .SRCINFO and commit changes"
    echo "  push        - Push changes to AUR repository"
    echo "  setup-aur   - Set up AUR remote (run once after cloning)"
    echo "  help        - Show this help message"
}

function test_build() {
    echo "Testing package build..."
    makepkg --syncdeps --rmdeps --clean
    echo "Build test successful!"
}

function update_srcinfo() {
    echo "Updating .SRCINFO..."
    makepkg --printsrcinfo > .SRCINFO
    git add .SRCINFO PKGBUILD
    
    if git diff --staged --quiet; then
        echo "No changes to commit."
    else
        read -p "Commit message: " commit_msg
        git commit -m "$commit_msg"
        echo "Changes committed."
    fi
}

function push_to_aur() {
    echo "Pushing to AUR..."
    if ! git remote | grep -q aur; then
        echo "AUR remote not set up. Run '$0 setup-aur' first."
        exit 1
    fi
    
    git push aur master
    echo "Pushed to AUR successfully!"
}

function setup_aur_remote() {
    echo "Setting up AUR remote..."
    if git remote | grep -q aur; then
        echo "AUR remote already exists."
        git remote set-url aur "$AUR_URL"
    else
        git remote add aur "$AUR_URL"
    fi
    echo "AUR remote set up at: $AUR_URL"
    echo "Make sure you have SSH access to AUR configured."
}

case "$1" in
    test)
        test_build
        ;;
    update)
        update_srcinfo
        ;;
    push)
        push_to_aur
        ;;
    setup-aur)
        setup_aur_remote
        ;;
    help|--help|-h)
        usage
        ;;
    "")
        usage
        ;;
    *)
        echo "Unknown command: $1"
        usage
        exit 1
        ;;
esac
