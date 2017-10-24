# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: vuslkopp <vuslkopp@i2pmail.org>

pkgname=irclog2html
pkgver=2.15.3
pkgrel=1
pkgdesc='Converts IRC log files to HTML with pretty colours.'
arch=('any')
license=('GPL')
url='http://mg.pov.lt/irclog2html/'
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/i/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('88038cbd808917465a7413f90af6e7bd4c11b55df7026e3d225c1bf69c95ddf3')

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
}
