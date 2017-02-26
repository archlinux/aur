# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=jupyter-singular
pkgver=0.9.2
pkgrel=1
pkgdesc="Jupyter kernel for Singular"
arch=(any)
url="https://github.com/sebasguts/jupyter_kernel_singular"
license=(GPL)
depends=(python-pysingular jupyter-notebook python-ipywidgets)
source=(https://pypi.io/packages/source/j/jupyter_kernel_singular/jupyter_kernel_singular-$pkgver.tar.gz)
md5sums=('915e2e89b759297a8aebcfe8ca400cbb')

build() {
  cd jupyter_kernel_singular-$pkgver
  python setup.py build 
}

package() {
  cd jupyter_kernel_singular-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
