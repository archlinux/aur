# Maintainer: Max le Fou <buttbadger at gmail dot com>
pkgname=icegenerator
pkgver=0.5.5pre2
pkgrel=1
pkgdesc="A direct streaming generator for Icecast/Shoutcast."
arch=('x86_64')
url="https://www.becrux.com/pages/projects/icegenerator"
license=(GPL2)
depends=('libshout')
optdepends=('id3lib: ID3 support')
source=("https://www.becrux.com/pages/projects/icegenerator/${pkgname}-0.5.5-pre2.tar.gz")
sha256sums=('60487ea6c63e67d39a7c2f7d224b985f664381d12855bf234797121052e0d5f8')

prepare() {
  cd "${pkgname}-0.5.5-pre2"
  ./configure
}

build() {
  cd "${pkgname}-0.5.5-pre2"
  make
}

package() {
  cd "${pkgname}-0.5.5-pre2"
  make install DESTDIR=${pkgdir}
}
