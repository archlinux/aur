# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: vuslkopp <vuslkopp@i2pmail.org>

pkgname=irclog2html
pkgver=2.17.2
pkgrel=1
pkgdesc='Colourises and converts IRC logs to HTML format for easy web reading.'
arch=('any')
license=('GPL2')
url='https://mg.pov.lt/irclog2html/'
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/i/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('5c0f3a5485c8d2139c7ba6f8b72b4a5844df12fa7c711532bbbbaa1077cea421')

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1
}
