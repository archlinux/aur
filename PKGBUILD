# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>

_dbname=stein_watkins
pkgname=sage-data-stein-watkins
pkgver=20110713
pkgrel=1
pkgdesc="The Stein-Watkins database of elliptic curves (full version) for SageMath"
arch=(any)
url="https://www.sagemath.org"
license=(GPL)
depends=(sagemath)
makedepends=()
source=("https://mirrors.mit.edu/sage/spkg/upstream/database_$_dbname/database_$_dbname-$pkgver.tar.gz")
b2sums=('4abcbacc720d2e49984c8d28ba26db119abce349dd8b212a0e6b13c14553b7b7f30c6e4c36d914effe1d18956c1d8e744ffca7d931b6d07e973bdd63c264833e')

package() {
  cd database_$_dbname-$pkgver/swdb
  mkdir -p "$pkgdir"/usr/share/$_dbname
  install -m644 * "$pkgdir"/usr/share/$_dbname
}
