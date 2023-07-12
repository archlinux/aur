# Maintainer: getzze <getzze [at] @gmail [dot] com>
# Maintainer: Maziar Saleh Ziabari
# Contributor: Philipp A. <flying-sheep@web.de>

pkgname=jupyter_nbextensions_configurator
pkgver=0.6.3
pkgrel=1
pkgdesc='Jupyter serverextension providing configuration interfaces for nbextensions'
arch=(any)
url="https://github.com/jupyter-contrib/$pkgname"
license=(BSD)
depends=(python jupyter-notebook jupyter-nbconvert python-tornado python-yaml)
source=("$pkgname-$pkgver"::"https://github.com/Jupyter-contrib/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6ec41b4be8ba8df25fdc23f224976b6e46ecb00405317cb197b94d973305c9d1')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
