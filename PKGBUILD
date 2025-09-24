# -----------------------------------------------------------------------------
# author: damachine (christkue79@gmail.com)
# Maintainer: DAMACHINE <christkue79@gmail.com>
# website: https://github.com/damachine
#          https://github.com/damachine/tkginstaller 
# copyright: (c) 2025 damachine
# license: MIT
# version: 1.0
#   This software is provided "as is", without warranty of any kind, express or implied.
#   I do not guarantee that it will work as intended on your system.
#
# Info:
# 	TKG-Installer 🐸
# 	Manage TKG/Frogminer packages.
# 	Supports Linux-TKG, Nvidia-TKG, Mesa-TKG, Wine-TKG, Proton-TKG.
# 	Provides a user-friendly menu with previews.
# 	Includes configuration editor functions.
# 	Designed for Arch Linux but adaptable to other distributions.
# Details:
#   This script handles installation, configuration for TKG/Frogminer packages.
#   It uses color output and Unicode icons for better readability.
#   Do not run as root. Use a dedicated user for security.
#   See https://github.com/damachine/tkginstaller further details.
# -----------------------------------------------------------------------------
pkgname=tkginstaller-git
pkgver=0.4.8
pkgrel=1
provides=('tkginstaller')
replaces=('tkginstaller')
conflicts=('tkginstaller')
pkgdesc="Manage the popular TKG packages (Kernel, Nvidia, Mesa, Wine, Proton) from the Frogging-Family repositories. 🐸"
arch=('x86_64')
url="https://github.com/damachine/tkginstaller"
license=('MIT')
depends=('fzf' 'bat' 'curl' 'git' 'glow')
optdepends=('nano: for editing config files'
            'onefetch: for git info display'
            'vim: for editing config files')
source=("tkginstaller.sh::https://raw.githubusercontent.com/damachine/tkginstaller/refs/heads/master/tkginstaller.sh")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/tkginstaller.sh" "$pkgdir/usr/bin/tkginstaller"
}
