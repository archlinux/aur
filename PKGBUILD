# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=jupyter_nbextensions_configurator
pkgver=0.4.1
pkgrel=1
pkgdesc='Jupyter serverextension providing configuration interfaces for nbextensions'
arch=(any)
url="https://github.com/jupyter-contrib/$pkgname"
license=(BSD)
depends=(python jupyter jupyter-notebook jupyter-nbconvert python-tornado python-yaml)
#makedepends=(python-pip)
#_wheel="$pkgname-$pkgver-py2.py3-none-any.whl"
#source=("https://files.pythonhosted.org/packages/py2.py3/${pkgname::1}/$pkgname/$_wheel")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('e5e86b5d9d898e1ffb30ebb08e4ad8696999f798fef3ff3262d7b999076e4e83')

package() {
	#pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
