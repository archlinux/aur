# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=chruby-fish
pkgver=1.0.0
pkgrel=1
pkgdesc="A compatible implementation of chruby for the Fish shell"
arch=(any)
url="https://github.com/JeanMertz/chruby-fish"
license=('MIT')
depends=('fish')
install=${pkgname}.install

source=("https://github.com/JeanMertz/chruby-fish/archive/v${pkgver}.tar.gz")
sha256sums=('db1023255fa55c9a01b06404cd394cccf790d42985cf85706211e5a0dda4fd9f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX="${pkgdir}/usr" install >/dev/null
}
