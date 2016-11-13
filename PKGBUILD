pkgbase=('python-wrld')
pkgname=('python-wrld')
_module='wrld'
pkgver='0.3'
pkgrel=1
pkgdesc="simplified bash loops (or, xargs -I on steroids)"
url="https://github.com/ninjaaron/wrld"
depends=('python')
makedepends=('python-pip' 'python-wheel')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/c3/9d/5111367c007e98d20d1f83726d701e80b6f564a12ac6eb951d5dea4f5249/wrld-0.3.tar.gz")
md5sums=('0a2cc7ce7fd2c73180d0ffb87ae9229d')

build() {
    cd "${srcdir}/wrld-0.3"
    pip3 wheel .
}

package() {
    depends+=()
    cd "${srcdir}/wrld-0.3"
    pip3 install --ignore-installed --root="${pkgdir}" "wrld"*.whl
}
