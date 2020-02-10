# Maintainer: Ardeaf <ardeaf@gmail.com>

pkgname=redelete-bin
pkgver=0.2.3
pkgrel=1
pkgdesc='Delete all of your reddit comments and submissions, with optional filters to skip certain posts.'
arch=('x86_64')
_target="$CARCH-unknown-linux-gnu"
url=https://github.com/ardeaf/redelete
license=('MIT')
depends=('gcc-libs')
source=("redelete-v$pkgver-$_target.tar.gz::$url/releases/download/v$pkgver/redelete-v$pkgver-$_target.tar.gz")

package() {
  cd redelete-v$pkgver-$_target
  install -Dm755 redelete "$pkgdir"/usr/bin/redelete
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/redelete/LICENSE
}
md5sums=('a7359083a303e95c40e1c963a2e6c7e6')
