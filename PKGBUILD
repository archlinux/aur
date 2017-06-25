pkgbase=('wrld')
pkgname=('wrld')
_module='wrld'
pkgver='0.7'
pkgrel=1
pkgdesc="simplified bash loops (or, xargs -I on steroids)"
url="https://github.com/ninjaaron/wrld"
depends=('python')
makedepends=('python-pip' 'python-wheel')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/48/a7/355f48846a9fdfc1846efd2e1211c30b0cae5718eeaecb1cf4ab02646f70/wrld-0.7.tar.gz")
md5sums=('a3725858eec064edd5e321610e2a7bff')

build() {
    cd "${srcdir}/wrld-0.7"
    pip3 wheel .
}

package() {
    depends+=()
    cd "${srcdir}/wrld-0.7"
    pip3 install --ignore-installed --root="${pkgdir}" "wrld"*.whl
}
