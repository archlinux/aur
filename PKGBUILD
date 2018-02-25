# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=jupyter_nbextensions_configurator
pkgver=0.4.0
pkgrel=1
pkgdesc='Jupyter serverextension providing configuration interfaces for nbextensions'
arch=(any)
url="https://github.com/jupyter-contrib/$pkgname"
license=(BSD)
depends=(python jupyter jupyter-notebook jupyter-nbconvert python-tornado python-yaml)
makedepends=(python-pip)
_wheel="$pkgname-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('e2cea15dde24c9090104cf3ebedd6bcd354004cbea5e858b3776372ad50b7d46')

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
