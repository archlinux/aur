# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=epub-tools
pkgver=2.10
pkgrel=1
pkgdesc='Command line utilities for working with epub files'
arch=('x86_64')
url='https://github.com/dino-/epub-tools'
license=('BSD3')
depends=('gmp' 'zlib')
makedepends=()
source=("https://github.com/dino-/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-linux.tar.gz")

sha256sums=('e6a0912fa7d4d58fd83b95a99c10f4d07fb6de15b86af9a622c80eee31a17278')


# PKGBUILD functions

package() {
   cd ${srcdir}/${pkgname}-${pkgver}
   mkdir "${pkgdir}/usr"
   cp -r * "${pkgdir}/usr"
}
