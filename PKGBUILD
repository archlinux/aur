# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>

pkgbase=python-securesystemslib
pkgname=('python-securesystemslib')
pkgver=0.10.8
pkgrel=1
pkgdesc="Cryptographic and general-purpose routines for Secure Systems Lab projects at NYU"
arch=('any')
license=('MIT')
url="https://github.com/secure-systems-lab/securesystemslib"
provides=("python-securesystemslib")
depends=('python-cryptography')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("git+https://github.com/secure-systems-lab/securesystemslib#commit=3db6a951d175e0d98468e86a2949292e765780a8")
sha512sums=('SKIP')

build() { 
    cd ${srcdir}/securesystemslib
    python setup.py build
}

package() {
    cd securesystemslib
    python setup.py install --root="${pkgdir}/" --optimize=1
}
