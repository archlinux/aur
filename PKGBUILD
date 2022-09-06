# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cavif-bin
pkgver=1.3.5
pkgrel=1
pkgdesc="AVIF image creator in pure Rust"
arch=('x86_64')
url="https://lib.rs/crates/cavif"
license=('BSD')
provides=("cavif=$pkgver")
conflicts=('cavif')
source_x86_64=("https://github.com/kornelski/cavif-rs/releases/download/v$pkgver/cavif-$pkgver.zip")
sha256sums_x86_64=('9b717caff36e563cb8b15bea2dab75ea7664c4df63fc6677a2e8cfa13341a2fc')


package() {
  install -Dm755 "linux-generic/cavif" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/cavif"
}
