# Maintainer: Dimitrios Desyllas <pcmagas@disroot.org>
pkgname='mkdotenv'
pkgver=0.3.0
pkgrel=1
pkgdesc="Lightweight and efficient tool for managing your .env files."
arch=('x86_64')
url="https://github.com/pc-magas/mkdotenv"
license=('GPL-3')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pc-magas/mkdotenv/releases/download/v$pkgver/mkdotenv-$pkgver.tar.gz")
sha256sums=('163ccb78a74532919cee18e4ad6c25670f79096c2dc88dc85f9560d61a17b7a4')


build() {
    make VERSION="${pkgver}"
}

package() {
    make install DESTDIR="${pkgdir}"
}
