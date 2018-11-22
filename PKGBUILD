# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: vuslkopp <vuslkopp@i2pmail.org>

pkgname=irclog2html
pkgver=2.17.0
pkgrel=1
pkgdesc='Colourises and converts IRC logs to HTML format for easy web reading.'
arch=('any')
license=('GPL2')
url='https://mg.pov.lt/irclog2html/'
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/i/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('50fbfa1d2b046497058c4b805742b6883b29f9e3da36b0eaf67b71676b3c3105')

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1
}
