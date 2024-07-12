# Maintainer Popolon <popolon @ popolon . org>
# generated using pip2pkgbuild --pep517

pkgbase='python-geovisio_cli'
pkgname=('python-geovisio_cli')
_module='geovisio_cli'
_src_folder='geovisio_cli-0.3.13'
pkgver='0.3.13'
pkgrel=1
pkgdesc="Geovio client cli tool"
url="None"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/03/07/d893445f13e864daef36a5794010f713ddd74838fcfccfb6dc924f91451d/geovisio_cli-0.3.13.tar.gz")
sha256sums=('f4fed849d86ec2eb41503040f1f3c890a0f514817047e81de66ce404c942641e')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
