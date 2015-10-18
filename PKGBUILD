# $Id: PKGBUILD 126373 2015-01-21 20:31:43Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=pari-jupyter
pkgver=1.0.0
pkgrel=1
pkgdesc="Jupyter kernel for PARI"
arch=(any)
url="http://www.sagemath.org"
license=(GPL)
depends=(pari-sage jupyter)
makedepends=(cython)
source=(http://mirrors.mit.edu/sage/spkg/upstream/pari_jupyter/pari_jupyter-$pkgver.tar.gz)
md5sums=('902b290a997128e6be949c0bec44ca6e')

package() {
  cd pari_jupyter-$pkgver
  python setup.py install
}
