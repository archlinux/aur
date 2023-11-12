# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=apache-html-manual
_pkgname=httpd
pkgver=2.4.58
pkgrel=2
pkgdesc='Apache manual html pages'
arch=('any')
options=('libtool' '!strip' '!zipman' '!purge' 'docs')
url='https://www.apache.org/dist/httpd'
license=('APACHE')
source=(
http://www.apache.org/dist/httpd/httpd-${pkgver}.tar.bz2
)
sha256sums=('fa16d72a078210a54c47dd5bef2f8b9b8a01d94909a51453956b3ec6442ea4c5')
options=('emptydirs')

package() {
  cd "$srcdir"/${_pkgname}-$pkgver

  install -d "$pkgdir"/usr/share/$_pkgname
	cp -a "$srcdir"/httpd-$pkgver/docs/manual \
    "$pkgdir"/usr/share/$_pkgname/
}
