pkgbase=('python-dirlog')
pkgname=('python-dirlog')
_module='dirlog'
pkgver='1.0.1'
pkgrel=1
pkgdesc="keep a log of directories you visit to get back fast"
url="https://github.com/ninjaaron/dirlog"
depends=('python')
makedepends=('python-pip' 'python-wheel')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/c2/73/2a92d7b55ca7f0c3ae00408a7854a27bcaa3fac478cb2217c0d79e4606d5/dirlog-1.0.1.tar.gz")
md5sums=('3e192cca9e00bc2f3eca6adcad7f5ac2')

build() {
    cd "${srcdir}/dirlog-1.0.1"
    pip3 wheel .
}

package() {
    depends+=()
    cd "${srcdir}/dirlog-1.0.1"
    pip3 install --ignore-installed --root="${pkgdir}" "dirlog"*.whl
}
