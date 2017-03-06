# Maintainer: Phil Schaf <flying-sheep@web.de>
pkgname=jupyter_latex_envs
pkgver=1.3.7.2
pkgrel=2
pkgdesc='Jupyter notebook extension which supports (some) LaTeX environments within markdown cells'
arch=(any)
url=https://github.com/ipython-contrib/$_gitname
license=(BSD)
makedepends=()
depends=(python jupyter jupyter-notebook)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('625a6ec7163e3eab2ab146d7c390bef9')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
