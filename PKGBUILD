# Maintainer: Pig Fang <g-plane@hotmail.com>
# Maintainer: Mateusz Galazyn <carbolymer@gmail.com>
pkgname=cabal-install-bin
pkgver=3.10.2.0
pkgrel=1
pkgdesc="The command-line interface for Cabal and Hackage."
arch=(x86_64 aarch64)
url=https://www.haskell.org/cabal
license=(BSD)
depends=('glibc>=2.12')
provides=(cabal-install)
conflicts=(cabal-install)
source=(
  https://downloads.haskell.org/~cabal/cabal-install-$pkgver/cabal-install-$pkgver-$arch-linux-deb10.tar.xz
  https://downloads.haskell.org/~cabal/cabal-install-$pkgver/cabal-install-$pkgver.tar.gz
)
sha256sums=('bdeb27c008b09c3b86f8a2768018d62a1aee02565304d123fda87ed432549418'
            'b6deefa9fd0f8e6af1022f7f552b1214b562ee31cea6ab344c3fb12194645140')

package() {
  install -Dm755 "$srcdir/cabal" "$pkgdir/usr/bin/cabal"
  install -Dm644 "$srcdir/cabal-install-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/cabal-install/LICENSE"
}
