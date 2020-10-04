# Maintainer: Pig Fang <g-plane@hotmail.com>
pkgname=cabal-install-bin
pkgver=3.2.0.0
pkgrel=1
pkgdesc="The command-line interface for Cabal and Hackage."
arch=(x86_64)
url=https://www.haskell.org/cabal
license=(BSD)
depends=('glibc>=2.12')
provides=(cabal-install)
conflicts=(cabal-install)
source=(
  https://downloads.haskell.org/~cabal/cabal-install-$pkgver/cabal-install-$pkgver-$arch-unknown-linux.tar.xz
  https://downloads.haskell.org/~cabal/cabal-install-$pkgver/cabal-install-$pkgver.tar.gz
)
sha256sums=(32d1f7cf1065c37cb0ef99a66adb405f409b9763f14c0926f5424ae408c738ac SKIP)

package() {
  install -Dm755 "$srcdir/cabal" "$pkgdir/usr/bin/cabal"
  install -Dm644 "$srcdir/cabal-install-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/cabal-install/LICENSE"
}
