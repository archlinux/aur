# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=ramfetch
pkgver=1.0.2
pkgrel=2
pkgdesc="A fetch which displays memory info using /proc/meminfo"
url='https://github.com/o69mar/ramfetch'
arch=('x86_64')
license=('MIT')
makedepends=('make')
conflicts=('ramfetch-git')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7e6ad8f20a335b8f62fa2f85d105d186ddd75877e3d263b67729058330990928')

package() {
  cd $pkgname-$pkgver
  install -Dm755 ramfetch "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

