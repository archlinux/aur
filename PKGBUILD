# Maintainer: Michael Borders <michael.a.borders@gmail.com>

pkgname=python-textfsm
_pkgname=textfsm
pkgver=1.1.0
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Python module for parsing semi-structured text into python tables."
arch=('any')
url="https://github.com/google/textfsm"
license=('Apache')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("${url}/archive/${_pkgver}.tar.gz")
sha256sums=('b750de2986ef78696e686b510a96aa23206a575580daf2b1eb7e17525ed33045')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
