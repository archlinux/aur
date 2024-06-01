# Maintainer: Andreas Hemmerle <andreas dot hemmerle at gmail dot com>
pkgname=python-irgen
pkgver=0.2.0
pkgrel=2
pkgdesc='A python module/tool for generating and converting InfraRed commands.'
arch=(any)
license=(MIT)
url="https://github.com/elupus/irgen"
depends=("python>=3.7")
source=("$pkgname-$pkgver.tar.gz::https://github.com/elupus/irgen/archive/refs/tags/$pkgver.tar.gz")
md5sums=('fd3545116459c7bc7f020c588f78776b')
sha512sums=('191a59a30584fe0808903aae8912ae83006ccf7b027695f2d283b85e7c3cb606a9881fc8b6af5fc56333fe83bfda0abe101a8666146daeca905d33fc10010639')

package () {
  cd "$srcdir/irgen-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
