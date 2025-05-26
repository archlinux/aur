# Maintainer: Dimitrios Desyllas <pcmagas@disroot.org>
pkgname='mkdotenv'
pkgver=0.3.1
pkgrel=1
pkgdesc="Lightweight and efficient tool for managing your .env files."
arch=('x86_64')
url="https://github.com/pc-magas/mkdotenv"
license=('GPL-3')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pc-magas/mkdotenv/releases/download/v$pkgver/mkdotenv-$pkgver.tar.gz")
sha256sums=('cccca80ac3280eb1de0b0bb75ee967c8dd642d5dbdc85611cffe7c0e8206e9da')


build() {
    make VERSION="${pkgver}"
}

package() {
    make install DESTDIR="${pkgdir}"
}
