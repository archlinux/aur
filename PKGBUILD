# Maintainer: Arnab Bose <hirak99+arch@gmail.com>
pkgname=yabsnap
pkgver=1.08.2
pkgrel=1
pkgdesc="Btrfs automated snapshot manager."
arch=('any')
url="https://github.com/hirak99/yabsnap"
license=('Apache')
depends=('python3')
makedepends=('rsync')
provides=('yabsnap')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('b2502b56a8e7539631789051927f7dae')

check() {
  cd "$pkgname"-$pkgver
  src/run_tests.sh
}

package() {
  cd "$pkgname"-$pkgver
  scripts/install-to-dest.sh "$pkgdir"
}

