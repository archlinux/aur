# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=ramfetch
pkgver=1.1.0
pkgrel=1
pkgdesc="A fetch which displays memory info using /proc/meminfo"
url='https://codeberg.org/o69mar/ramfetch'
arch=('x86_64')
license=('MIT')
makedepends=('make')
conflicts=('ramfetch-git')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('008bc8c91c4537256bb5c2af51ce34ce9949a327215d314c818dbff68fcd03d4')

package() {
  mv $pkgname $pkgname-$pkgver
  cd $pkgname-$pkgver
  install -Dm755 ramfetch "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

