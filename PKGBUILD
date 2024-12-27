# Maintainer: mirdukkkkk <contact@mirdukkkkk.space>

pkgname=beefetch
pkgver=1.0.0
pkgrel=1
pkgdesc="Neofetch clone written in bash with the ability to display 🐝"
arch=('any')
url="https://github.com/mirdukkkkk/beefetch"
license=('GPL3.0-only')
source=("https://raw.githubusercontent.com/mirdukkkkk/beefetch/$pkgver/beefetch")
sha512sums=('3a7974110ca61a5cee7f2f7668c808d7f33f5fed4c10228ea8cf0aa8e80877c386d67e36e3f723738de577e9b596dd86e4be68914b1fe95db94993599df9c37e')

package() {
    install -Dm755 beefetch "$pkgdir"/usr/bin/beefetch
}

package_debug() {
    return 1
}