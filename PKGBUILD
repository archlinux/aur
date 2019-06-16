# Maintainer: Jake Barnes <me+aur@jakebarn.es>
pkgname=liblivesplit-core
pkgver=0.11.0
pkgrel=1
pkgdesc="a library that provides a lot of functionality for creating a speedrun timer"
arch=('x86_64')
url="https://github.com/LiveSplit/livesplit-core"
license=('Apache-2.0/MIT')
source=("https://github.com/LiveSplit/livesplit-core/releases/download/v$pkgver/livesplit-core-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
        "livesplit_core.pc")
sha1sums=('7683743ee98f84831a1c9310ad3dc8f019b22860'
          'SKIP')

package() {
  install -Dm644 liblivesplit_core.so "$pkgdir/usr/lib/liblivesplit_core.so"
  install -Dm644 livesplit_core.pc "$pkgdir/usr/lib/pkgconfig/livesplit_core.pc"
  install -Dm644 bindings/livesplit_core.h "$pkgdir/usr/include/livesplit_core.h"
}
