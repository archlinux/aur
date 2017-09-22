# $Id$
# Maintainer: Michael Greene <mgreene@securityinnovation.com>

pkgname=python-euclid3
pkgver=0.01
pkgrel=1
pkgdesc="SolidPython: OpenSCAD for Python"
arch=('any')
license=('LGPL2.1')
url="https://github.com/SolidCode/SolidPython"
makedepends=()
depends=()
source=("https://pypi.io/packages/source/e/euclid3/euclid3-${pkgver}.tar.gz")
sha256sums=(25b827a57adbfd9a3fa8625e43abc3e907f61de622343e7e538482ef9b46fd0b)
sha384sums=(843ad5cb5f637e508579265548679126a99fb3b9a48315fc55edd73ba2ddc809bbb1484db3adc2a86ca3cebcc5b0c668)

build() {
    cd ${srcdir}/euclid3-${pkgver}
    python setup.py build
}

package() {
    cd euclid3-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
