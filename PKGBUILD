pkgbase=('pyfil')
pkgname=('pyfil')
_module='pyfil'
pkgver='1.4'
pkgrel=1
pkgdesc="Python one-liners in the shell in the spirit of Perl and AWK"
url="https://github.com/ninjaaron/pyfil"
depends=('python')
makedepends=('python-pip' 'python-wheel')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/92/81/3d26f2d40c46ba0c89e2a05cf258057aac3f90b825a37571536c1630e688/pyfil-1.4.tar.gz")
md5sums=('69d5bd54663b6499fe62cd6719314bc3')

build() {
    cd "${srcdir}/pyfil-1.4"
    pip3 wheel .
}

package() {
    depends+=()
    cd "${srcdir}/pyfil-1.4"
    pip3 install --ignore-installed --root="${pkgdir}" "pyfil"*.whl
}
