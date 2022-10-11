# Maintainer: Arnab Bose <hirak99+arch@gmail.com>
pkgname=yabsnap
pkgver=1.06.1
pkgrel=1
pkgdesc="Btrfs automated snapshot manager."
arch=('any')
url="https://github.com/hirak99/yabsnap"
license=('Apache')
depends=('python3')
makedepends=('rsync' 'lsb-release')
provides=('yabsnap')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('b9f6f004c88fe0f4b9c37ce39f1a50de')

check() {
  cd "$pkgname"-$pkgver
  src/run_tests.sh
}

package() {
  cd "$pkgname"-$pkgver
  scripts/install-to-dest.sh "$pkgdir"
}

