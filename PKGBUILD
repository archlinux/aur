# Maintainer: Marshall Ward <f90nml@marshallward.org>

pkgname=python-f90nml
pkgver=1.4.3
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
source=('https://files.pythonhosted.org/packages/70/23/2f59cc4a4f7439ad2f61b1d31518887a79deb4944a1b2386ca842acc4b01/f90nml-1.4.3.tar.gz')
noextract=()
md5sums=('cdc8c536ab2961907121863733d50c95')

package() {
    cd ${srcdir}/f90nml-${pkgver}
    python setup.py install --root=${pkgdir}/ --optimize=1
}
