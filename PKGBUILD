pkgbase=('python-dirlog')
pkgname=('python-dirlog')
_module='dirlog'
pkgver='1.2.0'
pkgrel=1
pkgdesc="keep a log of directories you visit to get back fast"
url="https://github.com/ninjaaron/dirlog"
depends=('python')
makedepends=('python-pip' 'python-wheel')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/7b/92/73935e2d30d7206c43015cc9286f28dc4c6ff1d9cc0798335d2f11d25f0f/dirlog-1.2.0.tar.gz")
md5sums=('80b6c66b77746dd47c6eb3167fe1107e')

build() {
    cd "${srcdir}/dirlog-1.2.0"
    pip3 wheel .
}

package() {
    depends+=()
    cd "${srcdir}/dirlog-1.2.0"
    pip3 install --ignore-installed --root="${pkgdir}" "dirlog"*.whl
}
