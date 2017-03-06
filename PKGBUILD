# Maintainer: Phil Schaf <flying-sheep@web.de>
pkgname=jupyter_highlight_selected_word
pkgver=0.0.8
pkgrel=1
pkgdesc='Jupyter notebook extension that enables highlighting every instance of the current word in the notebook'
arch=(any)
url=https://github.com/ipython-contrib/$_gitname
license=(BSD)
makedepends=()
depends=(python jupyter jupyter-notebook)
_wheel="$pkgname-$pkgver-py2.py3-none-any.whl"
source=("$_wheel::https://files.pythonhosted.org/packages/py2.py3/${pkgname::1}/$pkgname/$_wheel")
md5sums=('10655fb33701f5d02eac2c7cf03bb1f2')
noextract=("$_wheel")

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
