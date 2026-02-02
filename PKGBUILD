# Contributor: RcrdBrt
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=python-pysqlcipher3
_pkgname=${pkgname#python-}
pkgver=1.0.3
pkgrel=2
pkgdesc='Python 3 bindings for SQLCipher (project no longer maintained. Vulnerabilities may exist)'
arch=('any')
url='https://github.com/rigglemania/pysqlcipher3'
depends=('python' 'sqlcipher')
makedepends=('python-setuptools')
license=('ZLIB')
source=("https://files.pythonhosted.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('694e5bbb6ece8a064bd55f261e54b9ffbb3af1784afdc4dce4948a0251a8a430')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
pkgname=python-pysqlcipher3
pkgver=1.2.0
pkgrel=1
pkgdesc="Python bindings for SQLCipher"
arch=('x86_64')
url="https://github.com/rigglemania/pysqlcipher3"
license=('BSD')
depends=('python' 'sqlcipher')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pysqlcipher3/pysqlcipher3-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "pysqlcipher3-${pkgver}"
  python setup.py build
}

package() {
  cd "pysqlcipher3-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1

}
