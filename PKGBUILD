# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-profig
pkgname='python-profig'
_name=${pkgname#python-}
pkgver=0.5.1
pkgrel=4
pkgdesc="A threading library written in python. Help you build threaded app."
arch=('any')
url="https://github.com/dhagrow/profig"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('6c95e2dc9b1736db4d341c5a94906319c54db36c181bfcb7fe6d2c92b95e3aaa12e70763ee55b491e6aaeaa6c9967104debeb67976a39c0bcf2a227e17828b03')

package() {
  cd profig-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
