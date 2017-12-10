# Maintainer: robertfoster
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=python2-pjproject
pkgver=2.7.1
pkgrel=1
pkgdesc="Open source SIP stack and media stack (also known as pjsip)"
arch=('i686' 'x86_64')
url="http://www.pjsip.org/"
license=('GPL')
depends=('pjproject' 'python2')
makedepends=('python2-distribute')
source=("http://www.pjsip.org/release/$pkgver/${pkgname##python2-}-$pkgver.tar.bz2")

package() {
  cd $srcdir/${pkgname##python2-}-$pkgver

  cd pjsip-apps/src/python/
  python2 setup.py install --root="$pkgdir"
}

md5sums=('99a64110fa5c2debff40e0e8d4676380')
