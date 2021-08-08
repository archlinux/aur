# Maintainer: Pig Fang <g-plane@hotmail.com>
pkgname=cabal-install-bin
pkgver=3.4.0.0
pkgrel=1
pkgdesc="The command-line interface for Cabal and Hackage."
arch=(x86_64)
url=https://www.haskell.org/cabal
license=(BSD)
depends=('glibc>=2.12')
provides=(cabal-install)
conflicts=(cabal-install)
source=(
  https://downloads.haskell.org/~cabal/cabal-install-$pkgver/cabal-install-$pkgver-$arch-ubuntu-16.04.tar.xz
  https://downloads.haskell.org/~cabal/cabal-install-$pkgver/cabal-install-$pkgver.tar.gz
)
sha256sums=(cf28f9ffd763476aa2b1730d85cbf155d366fac541f78ee3951e8cb2d6de63e6 SKIP)

package() {
  install -Dm755 "$srcdir/cabal" "$pkgdir/usr/bin/cabal"
  install -Dm644 "$srcdir/cabal-install-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/cabal-install/LICENSE"
}
