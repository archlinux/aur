# Maintainer: Marshall Ward <f90nml@marshallward.org>

pkgname=python-f90nml
pkgver=0.17
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
source=('https://pypi.python.org/packages/source/f/f90nml/f90nml-0.17.tar.gz')
noextract=()
md5sums=('1d1e324ee325a1da79434a3a1a27f5eb')

package() {
    cd ${srcdir}/f90nml-${pkgver}
    python setup.py install --root=${pkgdir}/ --optimize=1
}
