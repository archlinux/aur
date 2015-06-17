# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>
pkgname=gedit-advancedfind
_pkgname=advanced_find
pkgver=3.6.0
pkgrel=1
pkgdesc="Advanced Find / Replace plugin for gedit"
arch=('any')
url="http://code.google.com/p/advanced-find/"
license=('GPL')
depends=('gedit')
source=("http://advanced-find.googlecode.com/files/$_pkgname-$pkgver.tar.gz")
sha1sums=('b7f4961aa2f4fbd6bc02668f8c2f1a9a2ba64424')

build() {
  cd "${srcdir}/$_pkgname-$pkgver"
  rm *.sh
  install -dm755 "${pkgdir}/usr/lib/gedit/plugins/advancedfind/"
  find . -type f -exec install -D -m644 {} $pkgdir/usr/lib/gedit/plugins/advancedfind/{} \;
}
