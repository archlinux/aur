# Maintainer: Roman Vasilev <2rvasilev@live.ru>
pkgname=yajhfc-pdf-plugin
pkgver=0.6.2
pkgrel=2
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
md5sums=('c0687fae459e774199967f53313581bc')

build() {
  # bsdtar -xf $pkgname$_div${pkgver//./_}.zip
  rm -rd $srcdir/{doc,examples,COPYING,README.txt,$pkgname$_div${pkgver//./_}.zip}
}

package() {
  mkdir -p ${pkgdir}/usr/share/yajhfc
  cd ${srcdir}
  cp -R ./ ${pkgdir}/usr/share/yajhfc/
}
