# Maintainer: Marshall Ward <f90nml@marshallward.org>

pkgname=python-f90nml
pkgver=1.0.1
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
source=('https://pypi.python.org/packages/9e/61/fdb99ff828ddbeb51649dba16bf5cc0ac76d538252ab2ee93a62c503b107/f90nml-1.0.1.tar.gz#md5=a029611eb1298f35935289627909c1c4')
noextract=()
md5sums=('a029611eb1298f35935289627909c1c4')

package() {
    cd ${srcdir}/f90nml-${pkgver}
    python setup.py install --root=${pkgdir}/ --optimize=1
}
