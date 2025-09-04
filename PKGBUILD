# -----------------------------------------------------------------------------
# author: damachine (christkue79@gmail.com)
# Maintainer: DAMACHINE <christkue79@gmail.com>
# website: https://github.com/damachine
# copyright: (c) 2025 damachine
# license: MIT
# version: 1.0
#   This software is provided "as is", without warranty of any kind, express or implied.
#   I do not guarantee that it will work as intended on your system.
#
# brief:
# 	🐸 TKG-Installer – Optimized
# 	Install and configure TKG/Frogminer packages with ease.
# 	Supports Linux-TKG, Nvidia-TKG, Mesa-TKG, Wine-TKG, Proton-TKG.
# 	Includes configuration editor and cleanup functions.
# 	Provides a user-friendly menu with previews.
# 	Designed for Arch Linux but adaptable to other distributions.
# details:
#   This script handles installation, configuration, cleanup, and service management for TKG/Frogminer.
#   Edit dependencies, paths, and user as needed for your system.
#   Do not run as root. Use a dedicated user for security.
#   Ensure all required dependencies are installed.
#   It uses color output and Unicode icons for better readability.
#   All paths and dependencies are configurable.
#   See README.md further details.
# example:
#   cd /path/to/tkginstaller
#   ./tkg_install
#   tkg_install
#
# --- Dependency notes ---
# - 'fzf', 'gcc', 'git', 'nano/vim etc.', 'bat' are required for running and building this installer.
# - Please ensure all these tools are installed before using the script.
# -----------------------------------------------------------------------------
pkgname=tkginstaller-git
pkgver=0.1.1
pkgrel=1
provides=('tkginstaller')
replaces=('tkginstaller')
conflicts=('tkginstaller')
pkgdesc="A user-friendly script for all TKG packages from the Frogging-Family"
arch=('x86_64')
url="https://github.com/damachine/tkginstaller"
license=('MIT')
depends=('fzf' 'git' 'gcc')
optdepends=('nano: for editing config files'
            'vim: for editing config files'
            'bat: for syntax highlighting'
            'onefetch: for system info display')
source=("tkg_install.sh::https://raw.githubusercontent.com/damachine/tkginstaller/refs/heads/master/tkg_install.sh")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/tkg_install.sh" "$pkgdir/opt/tkginstaller/tkg_install.sh"
}
