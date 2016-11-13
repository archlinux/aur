pkgbase=('pyfil')
pkgname=('pyfil')
_module='pyfil'
pkgver='1.2'
pkgrel=1
pkgdesc="Python one-liners in the shell in the spirit of Perl and AWK"
url="https://github.com/ninjaaron/pyfil"
depends=('python')
makedepends=('python-pip' 'python-wheel')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/f3/e8/8d3e122de89e2afbf88369fdd39771c5f314a4ffc4e90107f9cef2abc36f/pyfil-1.2.tar.gz")
md5sums=('db177e26d11801943d75d1e9bc4e7044')

build() {
    cd "${srcdir}/pyfil-1.2"
    pip3 wheel .
}

package() {
    depends+=()
    cd "${srcdir}/pyfil-1.2"
    pip3 install --ignore-installed --root="${pkgdir}" "pyfil"*.whl
}
