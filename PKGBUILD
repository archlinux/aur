# Contributor: Médéric Boquien <mboquien@free.fr>

pkgname=python-pyregion
pkgver=2.1.1
pkgrel=1
pkgdesc="A python module to parse ds9 and ciao region files"
arch=('i686' 'x86_64')
url="https://github.com/astropy/pyregion"
license=("MIT")
depends=('python' 'python-numpy>=1.3')
source=("https://files.pythonhosted.org/packages/source/p/pyregion/pyregion-${pkgver}.tar.gz")
sha512sums=('ae62218f3059c46bda2d168843004025a39af6f335be5ffb618a9eecfa27430eba185d619e988bfdb95bdddf84f4de07a45bd83e641a1f2792e36c039d165a58')

build() {
  cd ${srcdir}/pyregion-${pkgver}

  python setup.py build
}

package() {
  cd ${srcdir}/pyregion-${pkgver}

  python setup.py install --root=${pkgdir}/ --optimize=1
}
