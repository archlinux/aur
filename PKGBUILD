# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cavif-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="AVIF image creator in pure Rust"
arch=('x86_64')
url="https://lib.rs/crates/cavif"
license=('BSD')
provides=("cavif=$pkgver")
conflicts=('cavif')
source_x86_64=("https://github.com/kornelski/cavif-rs/releases/download/v$pkgver/cavif-$pkgver.zip")
sha256sums_x86_64=('1e5380b793494d16a14fea3511ff09a1d1a93747f5aaaaadb9b57828b3e68796')


package() {
  install -Dm755 "linux-generic/cavif" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/cavif"
}
