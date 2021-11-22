# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cavif-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="AVIF image creator in pure Rust"
arch=('x86_64')
url="https://lib.rs/crates/cavif"
license=('BSD')
provides=('cavif')
conflicts=('cavif')
source_x86_64=("https://github.com/kornelski/cavif-rs/releases/download/v1.3.1/cavif-$pkgver.zip")
sha256sums_x86_64=('32fa726038f04f552181df85f5ce9a819d88fcefaa4bc4b2d17ce322a1379ccf')


package() {
  install -Dm755 "linux-generic/cavif" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/cavif"
}
