# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cavif-bin
pkgver=1.5.4
pkgrel=1
pkgdesc="AVIF image creator in pure Rust"
arch=('x86_64')
url="https://lib.rs/crates/cavif"
license=('BSD')
provides=("cavif=$pkgver")
conflicts=('cavif')
source_x86_64=("https://github.com/kornelski/cavif-rs/releases/download/v$pkgver/cavif-$pkgver.zip")
sha256sums_x86_64=('2536375373dcfb852533f688b218392d47fcdac1f8893b18053e0baecdd0db8d')


package() {
  install -Dm755 "linux-generic/cavif" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/cavif"
}
