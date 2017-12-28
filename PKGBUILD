# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: vuslkopp <vuslkopp@i2pmail.org>

pkgname=irclog2html
pkgver=2.16.0
pkgrel=1
pkgdesc='Converts IRC log files to HTML with pretty colours.'
arch=('any')
license=('GPL2')
url='http://mg.pov.lt/irclog2html/'
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/i/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('7a3070be137150f10b9a1186400b4c4883bb66b8559c1d2c1e43a92e2f1ea3c9')

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1
}
