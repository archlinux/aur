# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cavif-bin
pkgver=1.3.3
pkgrel=2
pkgdesc="AVIF image creator in pure Rust"
arch=('x86_64')
url="https://lib.rs/crates/cavif"
license=('BSD')
provides=("cavif=$pkgver")
conflicts=('cavif')
source_x86_64=("https://github.com/kornelski/cavif-rs/releases/download/v$pkgver/cavif-$pkgver.zip")
sha256sums_x86_64=('928e885274e7a8ac889db0b56a55cf1baf74df26e4a175bc9118eaac144a42d2')


package() {
  install -Dm755 "linux-generic/cavif" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/cavif"
}
