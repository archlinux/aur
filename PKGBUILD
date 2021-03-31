# Maintainer: Richard Neumann aka rne. <r dot neumann at homeinfo fullstop de>

_pkgbase='backlight'
pkgname="python-${_pkgbase}"
pkgver=1.0.8
pkgrel=1
arch=('any')
pkgdesc="Backlight setting API and daemon."
url="https://github.com/homeinfogmbh/${_pkgbase}"
depends=('python' 'i2c-tools')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')
license=('GPL3')
groups=('homeinfo' 'hidsl')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')


package() {
    cd "${_pkgbase}"
    python setup.py install --root=${pkgdir} --optimize=1
}
