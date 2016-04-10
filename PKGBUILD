# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: vuslkopp <vuslkopp@i2pmail.org>

pkgname=irclog2html
pkgver=2.14.0
pkgrel=2
pkgdesc='Converts IRC log files to HTML with pretty colours.'
arch=('any')
license=('GPL')
url='http://mg.pov.lt/irclog2html/'
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/i/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('d905790ee62319f441e34e4460f2c67d8d47e45bc24c3f0e0d743f83eaae69a7')

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
}
