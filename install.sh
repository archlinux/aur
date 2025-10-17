#!/bin/bash

set -e

if [ -z "$TERM" ]; then
    export TERM=xterm
fi

clear
echo -e "\033[36mfilebyte installer\033[0m"
echo -e "\033[36m=================\033[0m"
echo -e "\033[36mby execRooted\033[0m"
echo ""

if [ "$EUID" -ne 0 ]; then
    echo -e "\033[0;31m[ERROR]\033[0m This installer must be run as root."
    echo -e "\033[1;33m[INFO]\033[0m Please run: sudo $0"
    exit 1
fi

detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "$ID"
    elif [ -f /etc/debian_version ]; then
        echo "debian"
    elif [ -f /etc/redhat-release ]; then
        echo "rhel"
    else
        echo "unknown"
    fi
}

install_build_deps() {
    local distro=$(detect_distro)
    echo -e "\033[1;33m[INFO]\033[0m Detected distribution: $distro"
    case "$distro" in
        ubuntu|debian|linuxmint|pop)
            echo -e "\033[1;33m[INFO]\033[0m Installing build dependencies for Debian/Ubuntu..."
            if ! apt update; then
                echo -e "\033[0;31m[ERROR]\033[0m Failed to update package list."
                exit 1
            fi
            if ! apt install -y build-essential pkg-config libssl-dev; then
                echo -e "\033[0;31m[ERROR]\033[0m Failed to install build dependencies."
                exit 1
            fi
            ;;
        arch|manjaro|endeavouros)
            echo -e "\033[1;33m[INFO]\033[0m Installing build dependencies for Arch Linux..."
            if ! pacman -Syu --noconfirm base-devel pkg-config openssl; then
                echo -e "\033[0;31m[ERROR]\033[0m Failed to install build dependencies."
                exit 1
            fi
            ;;
        fedora)
            echo -e "\033[1;33m[INFO]\033[0m Installing build dependencies for Fedora..."
            if ! dnf groupinstall -y "Development Tools"; then
                echo -e "\033[0;31m[ERROR]\033[0m Failed to install Development Tools."
                exit 1
            fi
            if ! dnf install -y pkg-config openssl-devel; then
                echo -e "\033[0;31m[ERROR]\033[0m Failed to install additional dependencies."
                exit 1
            fi
            ;;
        centos|rhel|almalinux|rocky)
            echo -e "\033[1;33m[INFO]\033[0m Installing build dependencies for CentOS/RHEL..."
            if ! yum groupinstall -y "Development Tools"; then
                echo -e "\033[0;31m[ERROR]\033[0m Failed to install Development Tools."
                exit 1
            fi
            if ! yum install -y pkgconfig openssl-devel; then
                echo -e "\033[0;31m[ERROR]\033[0m Failed to install additional dependencies."
                exit 1
            fi
            ;;
        opensuse|sles)
            echo -e "\033[1;33m[INFO]\033[0m Installing build dependencies for openSUSE..."
            if ! zypper install -y -t pattern devel_basis; then
                echo -e "\033[0;31m[ERROR]\033[0m Failed to install devel_basis pattern."
                exit 1
            fi
            if ! zypper install -y pkg-config libopenssl-devel; then
                echo -e "\033[0;31m[ERROR]\033[0m Failed to install additional dependencies."
                exit 1
            fi
            ;;
        *)
            echo -e "\033[1;33m[WARNING]\033[0m Unknown distribution. Please install build tools manually (build-essential or equivalent, pkg-config, libssl-dev)."
            echo -e "\033[1;33m[INFO]\033[0m Continuing with installation..."
            ;;
    esac
}

install_build_deps

install_rust() {
    local distro=$(detect_distro)
    echo -e "\033[1;33m[INFO]\033[0m Installing Rust..."
    case "$distro" in
        ubuntu|debian|linuxmint|pop)
            if apt install -y rustc cargo; then
                echo -e "\033[36m[SUCCESS]\033[0m Rust installed via apt."
                return 0
            else
                echo -e "\033[1;33m[INFO]\033[0m apt installation failed, falling back to rustup."
            fi
            ;;
        arch|manjaro|endeavouros)
            if pacman -S --noconfirm rust; then
                echo -e "\033[36m[SUCCESS]\033[0m Rust installed via pacman."
                return 0
            else
                echo -e "\033[1;33m[INFO]\033[0m pacman installation failed, falling back to rustup."
            fi
            ;;
        fedora)
            if dnf install -y rust cargo; then
                echo -e "\033[36m[SUCCESS]\033[0m Rust installed via dnf."
                return 0
            else
                echo -e "\033[1;33m[INFO]\033[0m dnf installation failed, falling back to rustup."
            fi
            ;;
        centos|rhel|almalinux|rocky)
            if yum install -y rust cargo; then
                echo -e "\033[36m[SUCCESS]\033[0m Rust installed via yum."
                return 0
            else
                echo -e "\033[1;33m[INFO]\033[0m yum installation failed, falling back to rustup."
            fi
            ;;
        opensuse|sles)
            if zypper install -y rust cargo; then
                echo -e "\033[36m[SUCCESS]\033[0m Rust installed via zypper."
                return 0
            else
                echo -e "\033[1;33m[INFO]\033[0m zypper installation failed, falling back to rustup."
            fi
            ;;
    esac
    echo -e "\033[1;33m[INFO]\033[0m Installing Rust via rustup..."
    if ! curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y; then
        echo -e "\033[0;31m[ERROR]\033[0m Failed to install Rust via rustup."
        exit 1
    fi
    export PATH="$HOME/.cargo/bin:$PATH"
}

if ! command -v cargo &> /dev/null; then
    install_rust
else
    echo -e "\033[1;33m[INFO]\033[0m Rust is already installed."
fi

echo -e "\033[1;33m[INFO]\033[0m Building filebyte..."
if ! cargo build --release; then
    echo -e "\033[0;31m[ERROR]\033[0m Failed to build filebyte."
    exit 1
fi

echo -e "\033[1;33m[INFO]\033[0m Installing filebyte to /usr/local/bin..."
if ! cp target/release/filebyte /usr/local/bin/filebyte; then
    echo -e "\033[0;31m[ERROR]\033[0m Failed to install filebyte."
    exit 1
fi

if ! chmod +x /usr/local/bin/filebyte; then
    echo -e "\033[0;31m[ERROR]\033[0m Failed to make filebyte executable."
    exit 1
fi

echo -e "\033[36m[SUCCESS]\033[0m Installation complete!"
echo -e "\033[1;33m[INFO]\033[0m You can now run 'filebyte' from anywhere."
echo -e "\033[1;33m[USAGE]\033[0m To run the filebyte, simply type: filebyte"
echo -e "\033[1;33m[USAGE]\033[0m For help run filebyte -h"