# Maintainer: Marshall Ward <f90nml@marshallward.org>

pkgname=python-f90nml
pkgver=0.20
pkgrel=1
pkgdesc="A Fortran namelist parser for Python"
arch=('any')
url="https://pypi.python.org/pypi/f90nml"
license=('Apache')
groups=()
depends=('python')
makedepends=('unzip' 'python-distribute')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=('https://pypi.python.org/packages/8f/9f/843a9ae3d9222b49a6dc19b7d6f1d9df7ed706479a6b8791e7432e01c376/f90nml-0.20.tar.gz#md5=f473aa34f9bc2e947275620bc1660b6f')
noextract=()
md5sums=('f473aa34f9bc2e947275620bc1660b6f')

package() {
    cd ${srcdir}/f90nml-${pkgver}
    python setup.py install --root=${pkgdir}/ --optimize=1
}
