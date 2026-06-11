# Maintainer: damachin3 (damachine3 at proton dot me)
# website: https://github.com/damachine/tkginstaller
pkgname=tkginstaller-git
pkgver=0.54.1
pkgrel=1
provides=('tkginstaller')
replaces=('tkginstaller')
conflicts=('tkginstaller')
pkgdesc="bash wrapper to build & install Frogging-Family stuff with ease"
arch=('x86_64')
url="https://github.com/damachine/tkginstaller"
license=('MIT')
depends=('git' 'onefetch')
optdepends=('bat: syntax highlighting'
            'curl: downloading files'
            'fzf: the interactive menu'
            'glow: markdown rendering'
            'nano: editing config files'
            'wdiff: comparing config files')
install=tkginstaller.install
source=("tkginstaller::https://raw.githubusercontent.com/damachine/tkginstaller/refs/heads/master/tkginstaller")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/tkginstaller" "$pkgdir/usr/bin/tkginstaller"
}
