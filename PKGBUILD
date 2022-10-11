# Maintainer: Arnab Bose <hirak99+arch@gmail.com>
pkgname=yabsnap
pkgver=1.05.5
pkgrel=1
pkgdesc="Btrfs automated snapshot manager."
arch=('any')
url="https://github.com/hirak99/yabsnap"
license=('Apache')
depends=('python3')
makedepends=('rsync' 'lsb-release')
provides=('yabsnap')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('d4bf29bb534bcecf29f9024792a0f51b')

check() {
  cd "$pkgname"-$pkgver
  src/run_tests.sh
}

package() {
  cd "$pkgname"-$pkgver
  scripts/install-to-dest.sh "$pkgdir"
}

