# Maintainer: Roman Vasilev <2rvasilev@live.ru>
pkgname=yajhfc
pkgver=0.6.3_1
pkgrel=1
pkgdesc="(Yet another Java HylaFAX client) is a client for the HylaFAX fax server written completely in Java."
arch=(any)
url="http://www.yajhfc.de/"
# TODO should _watch be removed?
_watch="http://www.yajhfc.de/downloads/current-version"
license=('GPL3')
groups=()
depends=(java-environment hicolor-icon-theme desktop-file-utils)
# makedepends=("rpmextract" "cpio")
optdepends=("yajhfc-pdf-plugin: PDF support plugin")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("http://download.yajhfc.de/releases/$pkgname-${pkgver//_/-}.noarch.rpm")
md5sums=('c467274497a6be424376033aef72dfad')

# build() {
  # rpm2cpio $pkgname-${pkgver//_/-}.noarch.rpm | xzcat | cpio -idmv
# }

package() {
  rm "$srcdir"/usr/share/$pkgname/lib
  cp -R "$srcdir"/usr "$pkgdir"/
}
