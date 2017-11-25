# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=jupyter_nbextensions_configurator
pkgver=0.2.7
pkgrel=1
pkgdesc='Jupyter serverextension providing configuration interfaces for nbextensions'
arch=(any)
url="https://github.com/jupyter-contrib/$pkgname"
license=(BSD)
depends=(python jupyter jupyter-notebook jupyter-nbconvert python-tornado python-yaml)
makedepends=(python-pip)
_wheel="$pkgname-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${pkgname::1}/$pkgname/$_wheel")
md5sums=('2f9d24165a73e812e590f00ccd8aa057')

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
