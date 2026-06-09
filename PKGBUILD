# Maintainer: LargeModGames <jay.sankatsing9@gmail.com>
pkgname=steamie-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="A terminal-native Steam client written in Rust (precompiled binary)"
arch=('x86_64')
url="https://github.com/LargeModGames/steamie"
license=('MIT')
depends=('gcc-libs')
provides=('steamie')
conflicts=('steamie')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/LargeModGames/steamie/v$pkgver/LICENSE"
        "README-$pkgver.md::https://raw.githubusercontent.com/LargeModGames/steamie/v$pkgver/README.md")
source_x86_64=("steamie-$pkgver-linux-x86_64.tar.gz::https://github.com/LargeModGames/steamie/releases/download/v$pkgver/steamie-linux-x86_64.tar.gz")
sha256sums=('SKIP' 'SKIP')
sha256sums_x86_64=('SKIP')

package() {
  install -Dm0755 "steamie" "$pkgdir/usr/bin/steamie"
  install -Dm0644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
