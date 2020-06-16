# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=info-ja-gnu-coreutils
_pkgname=info-ja-GNU_coreutils
pkgver=20190909
pkgrel=1
pkgdesc="Japanese version info manual"
arch=(any)
url="https://linuxjm.osdn.jp/"
license=('GPL')
install="${pkgname}.install"
source=("https://linuxjm.osdn.jp/info-pkg/${_pkgname}-${pkgver}.tar.gz")
md5sums=('29ad086afbe061f66d0bdca509589e52')

#prepare() {
#}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  tar cvfz coreutils-ja.info.gz coreutils-ja.info
}

#check() {
#}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm644 coreutils-ja.info.gz "$pkgdir/usr/share/info/coreutils-ja.info.gz"
}
