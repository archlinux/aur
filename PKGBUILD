# Maintainer: trya <tryagainprod@gmail.com>

pkgname=python2-splinter
pkgver=0.7.2
pkgrel=1
pkgdesc='Open source tool for testing web applications using Python'
arch=('any')
license=('unknown')
url="http://splinter.cobrateam.info"
depends=('python2>=2.7' 'python2-selenium' 'python2-lxml' 'python2-cssselect')
makedepends=('python2-setuptools')
source=(splinter-$pkgver.tar.gz::"https://github.com/cobrateam/splinter/archive/$pkgver.tar.gz")
md5sums=('af1e6c7056bd771982cdd9222baa122a')

package() {
  cd "$srcdir/splinter-$pkgver"

  python2 ./setup.py install --root="$pkgdir" --prefix=/usr
}
