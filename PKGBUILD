# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: David Campbell <davekong@archlinux.us>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: Frederik M.J.V. <freqmod VED iskrembilen Dott kom>

pkgname=python-tempita
pkgver=0.5.2
pkgrel=3
epoch=1
pkgdesc="A lightweight unicode templating language"
arch=('any')
url="http://pythonpaste.org/tempita/"
license=('custom:MIT')
depends=('python')
makedepends=('python-distribute')
source=(https://pypi.python.org/packages/source/T/Tempita/Tempita-${pkgver}.tar.gz)
sha256sums=('cacecf0baa674d356641f1d406b8bff1d756d739c46b869a54de515d08e6fc9c')

package() {
  cd Tempita-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}
