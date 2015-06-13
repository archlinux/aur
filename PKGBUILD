#Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
#Contributor: David Campbell <davekong@archlinux.us>
#Contributor: Cilyan Olowen <gaknar@gmail.com>
#Contributor: Frederik M.J.V. <freqmod VED iskrembilen Dott kom>
pkgname=python-tempita
pkgver=0.5.1
pkgrel=2
pkgdesc="A lightweight unicode templating language"
arch=('any')
url="http://pythonpaste.org/tempita/"
license=('MIT')
depends=('python')
makedepends=('python-distribute')
source=("http://pypi.python.org/packages/source/T/Tempita/Tempita-${pkgver}.tar.gz")
md5sums=('f75bdfeabd2f3755f1ff32d582a574a4')

package() {
  cd "${srcdir}/Tempita-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
