# Maintainer: LargeModGames <jay.sankatsing9@gmail.com>
pkgname=steamie-bin
pkgver=0.4.2
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

sha256sums=('045c7ed4c522e3b2a9974396a2a90a6f9000d65b739363239eb04ceb5302f20b' 'cf5db9ba5577c98a9bc177cf3bc302ff9ee3a4f21908980aca9e566138aaf4fa')
sha256sums_x86_64=('77d01dfec3101e996110ef2bd7d745af41c19c71e7e4e066fc0d16b0be349fdb')
package() {
  install -Dm0755 "steamie" "$pkgdir/usr/bin/steamie"
  install -Dm0644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
