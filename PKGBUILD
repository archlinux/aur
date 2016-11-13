pkgbase=('wrld')
pkgname=('wrld')
_module='wrld'
pkgver='0.5'
pkgrel=1
pkgdesc="simplified bash loops (or, xargs -I on steroids)"
url="https://github.com/ninjaaron/wrld"
depends=('python')
makedepends=('python-pip' 'python-wheel')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/12/bd/35b7380e77ae77ca635a46d65ee616f96f52ecedc2af045db98ab76a1565/wrld-0.5.tar.gz")
md5sums=('b674b6a979b8aca3441b40318e963689')

build() {
    cd "${srcdir}/wrld-0.5"
    pip3 wheel .
}

package() {
    depends+=()
    cd "${srcdir}/wrld-0.5"
    pip3 install --ignore-installed --root="${pkgdir}" "wrld"*.whl
}
