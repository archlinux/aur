# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: vuslkopp <vuslkopp@i2pmail.org>

pkgname=irclog2html
pkgver=2.13.1
pkgrel=1
pkgdesc='Converts IRC log files to HTML with pretty colours.'
arch=('any')
license=('GPL')
url='http://mg.pov.lt/irclog2html/'
depends=('python')
source=("http://pypi.python.org/packages/source/i/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9714287c284d7b960a5c7082d11cd9d60dcfd9b80ce9029f7a5e015a9d0b7757')

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
}
