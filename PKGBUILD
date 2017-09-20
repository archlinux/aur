# Contributor: Lenart Regebro
# Maintainer: Fabien Devaux <fdev 31 at gmail dot com>

pkgname=python-svg.path
pkgver=2.2
pkgrel=1
pkgdesc="SVG path objects and parser"
arch=(any)
url="https://github.com/regebro/svg.path"
license=('CCPL')
depends=('python')

source=(https://files.pythonhosted.org/packages/1d/6c/cf484a95b895a7acd3989082501c67c8f43b6f91181f2a0b7aa634d1df6f/svg.path-2.2.tar.gz)
md5sums=('4dc43f859480918316fb62a45ed881d7')

package() {
cd "${srcdir}/svg.path-${pkgver}"
python setup.py install --root="${pkgdir}" --optimize=1
}
