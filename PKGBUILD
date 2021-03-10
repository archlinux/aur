# Maintainer: Roman Vasilev <2rvasilev@live.ru>
pkgname=yajhfc-pdf-plugin
pkgver=0.6.3
pkgrel=1
pkgdesc="PDF Plugin for (Yet another Java HylaFAX client)."
_div="-"
arch=(any)
url="http://www.yajhfc.de/"
license=('GPL3')
groups=()
depends=(yajhfc)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
# install=${pkgname}.install
changelog=
source=("http://download.yajhfc.de/releases/$pkgname$_div${pkgver//./_}.zip")
md5sums=('8827b0941b0ecf9aa5540e771e3c56ed')

build() {
  # bsdtar -xf $pkgname$_div${pkgver//./_}.zip
  rm -rd $srcdir/{doc,examples,COPYING,README.txt,$pkgname$_div${pkgver//./_}.zip}
}

package() {
  mkdir -p ${pkgdir}/usr/share/yajhfc
  cd ${srcdir}
  cp -R ./ ${pkgdir}/usr/share/yajhfc/
}
