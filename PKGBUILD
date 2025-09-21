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
# Info:
# 	TKG-Installer 🐸
# 	Install and configure TKG/Frogminer packages with ease.
# 	Supports Linux-TKG, Nvidia-TKG, Mesa-TKG, Wine-TKG, Proton-TKG.
# 	Includes configuration editor and cleanup functions.
# 	Provides a user-friendly menu with previews.
# 	Designed for Arch Linux but adaptable to other distributions.
# Details:
#   This script handles installation, configuration, and cleanup for TKG/Frogminer packages.
#   Do not run as root. Use a dedicated user for security.
#   It uses color output and Unicode icons for better readability.
#   See README.md further details.
# -----------------------------------------------------------------------------
pkgname=tkginstaller-git
pkgver=0.4.2
pkgrel=1
provides=('tkginstaller')
replaces=('tkginstaller')
conflicts=('tkginstaller')
pkgdesc="Manage the popular TKG packages (Kernel, Nvidia, Mesa, Wine, Proton) from the Frogging-Family repositories in a simple, user-friendly way. 🐸"
arch=('x86_64')
url="https://github.com/damachine/tkginstaller"
license=('MIT')
depends=('fzf' 'git' 'gcc')
optdepends=('bat: for syntax highlighting'
            'curl: for downloading files'
            'glow: for markdown converting and viewing'
            'llvm: for non-Arch distributions'
            'nano: for editing config files'
            'onefetch: for git info display'
            'vim: for editing config files'
            'wget: for downloading files')
source=("tkginstaller.sh::https://raw.githubusercontent.com/damachine/tkginstaller/refs/heads/master/tkginstaller.sh")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/tkginstaller.sh" "$pkgdir/usr/bin/tkginstaller"
}
