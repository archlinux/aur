# Maintainer: Dimitrios Desyllas <pcmagas@disroot.org>
pkgname='mkdotenv'
pkgver=0.2.3
pkgrel=1
pkgdesc="Lightweight and efficient tool for managing your .env files."
arch=('x86_64')
url="https://github.com/pc-magas/mkdotenv"
license=('GPL-3')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pc-magas/mkdotenv/releases/download/v$pkgver/mkdotenv-$pkgver.tar.gz")
sha256sums=('SKIP')


build() {
    make compile VERSION="${pkgver}"
}

package() {
    make install VERSION="${pkgver}" DESTDIR="${pkgdir}"
}