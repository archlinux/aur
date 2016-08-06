pkgbase=('python-dirlog')
pkgname=('python-dirlog')
_module='dirlog'
pkgver='0.2.10'
pkgrel=1
pkgdesc="keep a log of directories you visit to get back fast"
url="https://github.com/ninjaaron/dirlog"
depends=('python')
makedepends=('python-pip' 'python-wheel')
license=('unknown')
arch=('any')
source=("https://pypi.python.org/packages/72/a9/c944e0f530a98182783a5148d7539b26d8aa7311526d8c51d88b5af2b27c/dirlog-0.2.10.tar.gz")
md5sums=('ab1bbbd45b9741ba23ada48aba19da3d')

build() {
    cd "${srcdir}/dirlog-0.2.10"
    pip3 wheel .
}

package() {
    depends+=()
    cd "${srcdir}/dirlog-0.2.10"
    pip3 install --ignore-installed --root="${pkgdir}" "dirlog"*.whl
}
