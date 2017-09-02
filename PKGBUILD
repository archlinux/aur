pkgbase=('python-dirlog')
pkgname=('python-dirlog')
_module='dirlog'
pkgver='1.1.0'
pkgrel=1
pkgdesc="keep a log of directories you visit to get back fast"
url="https://github.com/ninjaaron/dirlog"
depends=('python')
makedepends=('python-pip' 'python-wheel')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/95/10/5d66c451a6c07c160570b6774282f2e61cba8fc3643d2b28571bdfcea96d/dirlog-1.1.0.tar.gz")
md5sums=('cdbea3d27721b64293fd2ae3bbeb3348')

build() {
    cd "${srcdir}/dirlog-1.1.0"
    pip3 wheel .
}

package() {
    depends+=()
    cd "${srcdir}/dirlog-1.1.0"
    pip3 install --ignore-installed --root="${pkgdir}" "dirlog"*.whl
}
