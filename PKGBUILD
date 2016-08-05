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
source=("https://pypi.python.org/packages/e0/99/a38658e04d392a9efc6928ffe4fba0eeceb5b9bcc07e6894bec45870b10c/dirlog-0.2.10-py3-none-any.whl")
md5sums=('a235a6b8ad0d89b4fe79a2b7fc1133cd')

package() {
    depends+=()
    cd "${srcdir}"
    pip3 install --ignore-installed --root="${pkgdir}" "dirlog-0.2.10-py3-none-any.whl"
}
