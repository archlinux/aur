# Maintainer: Allen Wild <allenwild93@gmail.com>
_name=dircolors
pkgname=python-${_name}
pkgver=0.0.4
pkgrel=2
pkgdesc='Python library to colorize and format file names based on type'
arch=('any')
url='https://github.com/aswild/pydircolors'
license=('Apache')
depends=('python')
makedepends=('python-pip')
_wheel="$_name-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('37884cefea7bf52ebbbb97743af9f970df08f4e15fb51bac24eb937f9a8d6a73')
noextract=("$_wheel")

build() {
    : # nothing to do
}

package() {
    pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
