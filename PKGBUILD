# Maintainer: RooobinYe
pkgname=ligamonaco-nerd-font-git
pkgver=1.0.0.r10.aa0037c
pkgrel=1
pkgdesc="Monaco Nerd Font with ligatures"
arch=('any')
url="https://github.com/RooobinYe/monaco-nerd-font-liga"
license=('MIT')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/monaco-nerd-font-liga"
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -m644 fonts-liga-nerd/* "${pkgdir}/usr/share/fonts/TTF/"
} 