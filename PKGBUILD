# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=info-ja-gnu-coreutils
_pkgname=info-ja-GNU_coreutils
pkgver=20170815
pkgrel=1
pkgdesc="Japanese version info manual"
arch=(any)
url="https://linuxjm.osdn.jp/"
license=('GPL')
install="${pkgname}.install"
source=("https://linuxjm.osdn.jp/info-pkg/${_pkgname}-${pkgver}.tar.gz")
md5sums=('a555f1f6e8d6038b1215978f8ddbcc66')

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
