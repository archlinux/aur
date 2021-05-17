# Maintainer: Marshall Ward <f90nml@marshallward.org>

pkgname=python-f90nml
pkgver=1.3
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
source=('https://files.pythonhosted.org/packages/9a/fe/b9added55f5de0b43e0bd01d9ab4bf5cab457a1080dc85e0b7a86c2a8307/f90nml-1.3.tar.gz')
noextract=()
md5sums=('c2c35593d2adb7b5daa24e15db95f8f3')

package() {
    cd ${srcdir}/f90nml-${pkgver}
    python setup.py install --root=${pkgdir}/ --optimize=1
}
