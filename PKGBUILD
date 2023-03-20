# Maintainer: Pig Fang <g-plane@hotmail.com>
# Maintainer: Mateusz Galazyn <carbolymer@gmail.com>
pkgname=cabal-install-bin
pkgver=3.10.1.0
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
sha256sums=('9c89f7150a6d09e653ca7d08d22922be2d9f750d0314d9a0a7e2103fac021fac'
            '995de368555449230e0762b259377ed720798717f4dd26a4fa711e8e41c7838d')

package() {
  install -Dm755 "$srcdir/cabal" "$pkgdir/usr/bin/cabal"
  install -Dm644 "$srcdir/cabal-install-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/cabal-install/LICENSE"
}
