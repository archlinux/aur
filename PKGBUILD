# -----------------------------------------------------------------------------
# author: damachine (christkue79@gmail.com)
# website: https://github.com/damachine
#          https://github.com/damachine/tkginstaller
# -----------------------------------------------------------------------------
# MIT License
#
# Copyright (c) 2025 damachine
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# -----------------------------------------------------------------------------
# Info:
#   TKG-Installer
#   Manage the popular TKG packages (Kernel, Nvidia, Mesa, Wine, Proton) from the Frogging-Family repositories.
#   Interactive Fuzzy finder fzf menue mode.
#   Quick direct command-line mode.
#   Preview readme and configuration.
#   Edit configuration files using your preferred editor.
#   Optional download configuration files.
# Details:
#   This script handles installation, configuration for TKG/Frogminer packages.
#   It uses color output and Unicode icons for better readability.
#   Do not run as root. Use a dedicated user for security.
#   See https://github.com/damachine/tkginstaller further details.
# Usage:
#   Interactive (Menu-mode)
#       run: tkginstaller
#   Command-line (Direct-mode)
#   Skip the menu and run specific actions directly:
#   Examples:
#       run: tkginstaller linux          # Install Linux-TKG
#       run: tkginstaller nvidia         # Install Nvidia-TKG
#       run: tkginstaller mesa           # Install Mesa-TKG
#       run: tkginstaller wine           # Install Wine-TKG
#       run: tkginstaller proton         # Install Proton-TKG
#       run: tkginstaller linux config   # Edit Linux-TKG config
#       run: tkginstaller l c            # Edit Linux-TKG config (short)
#   Show all available commands and shortcuts!
#       run: tkginstaller help
# -----------------------------------------------------------------------------
pkgname=tkginstaller-git
pkgver=0.12.5
pkgrel=1
provides=('tkginstaller')
replaces=('tkginstaller')
conflicts=('tkginstaller')
pkgdesc="Manage the popular TKG packages (Kernel, Nvidia, Mesa, Wine, Proton) from the Frogging-Family repositories."
arch=('x86_64')
url="https://github.com/damachine/tkginstaller"
license=('MIT')
depends=('bat' 'curl' 'glow' 'fzf' 'git')
optdepends=('nano: for editing config files'
            'onefetch: for git info display')
source=("tkginstaller.sh::https://raw.githubusercontent.com/damachine/tkginstaller/refs/heads/master/tkginstaller.sh")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/tkginstaller.sh" "$pkgdir/usr/bin/tkginstaller"
}
