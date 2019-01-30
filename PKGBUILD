# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

_pkgname=timeago
pkgname=python-${_pkgname}
pkgver=1.0.8
pkgrel=1
pkgdesc="Very simple python library, used to format datetime with \`***time ago\` statement."
arch=('any')
url="https://github.com/hustcc/timeago"
license=('MIT')
depends=()
makedepends=('python-pip')
provides=()
source=("https://files.pythonhosted.org/packages/py2.py3/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver-py2.py3-none-any.whl")
sha256sums=('f2acf144a9aabbc1e46a7f84387e6dd17bf41ff5fd87822c878621d06ef6b77c')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
