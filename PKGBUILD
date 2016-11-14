pkgbase=('pyfil')
pkgname=('pyfil')
_module='pyfil'
pkgver='1.3'
pkgrel=1
pkgdesc="Python one-liners in the shell in the spirit of Perl and AWK"
url="https://github.com/ninjaaron/pyfil"
depends=('python')
makedepends=('python-pip' 'python-wheel')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/22/db/99542e145c97161c25759f0cd2d575189e2ca8e959ba2914c09ff1d528c7/pyfil-1.3.tar.gz")
md5sums=('c7051f70d1c9b707d5ad824dd0a9d68a')

build() {
    cd "${srcdir}/pyfil-1.3"
    pip3 wheel .
}

package() {
    depends+=()
    cd "${srcdir}/pyfil-1.3"
    pip3 install --ignore-installed --root="${pkgdir}" "pyfil"*.whl
}
