# Maintainer: Your Name <youremail@domain.com>
_pkgbase=material-color-utilities
pkgname=python-material-color-utilities
pkgver=0.1.0
pkgrel=1
pkgdesc="Python port of material-color-utilities used for Material You colors"
arch=('any')
url="https://github.com/avanishsubbiah/material-color-utilities-python"
license=('unknown')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(https://raw.githubusercontent.com/AdwCustomizerTeam/AdwCustomizer/main/monet/material_color_utilities_python-0.1.0-py3-none-any.whl) 
b2sums=('9a7d32d088e69f461cd2261b9387ed98fcd871da3be8263a271e1b6942b371d3f1f3ad1dbf1515eac305bcb4017a3802cca01fee396b87bcecdaca687dd52807')

package() {
    python -m installer --destdir="$pkgdir" *.whl
}
