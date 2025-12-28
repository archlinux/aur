#Maintainer: Popolon <popolon aL popolon d0t org>
# generated with  pip2pkgbuild
# modified by hand

pkgname='python-jupyterlite-core'
_module='jupyterlite-core'
_src_folder='jupyterlite_core-0.7.1'
pkgver='0.7.1'
pkgrel=1
pkgdesc="None"
url="None"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:BSD License')
arch=('any')
source=("https://files.pythonhosted.org/packages/c4/11/1e48ddaae568efc2d8354ff89e9e46425e32a033df600286521488d5656d/jupyterlite_core-0.7.1.tar.gz")
sha256sums=('e9c1068f875c2e75dca3771a035eb31826a41343e62bbb77c80ad2a3478b6986')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
