# Maintainer: Bee <brandon@skerritt.blog>
pkgname=rustscan-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Faster Nmap Scanning with Rust"
url="https://github.com/brandonskerritt/rustscan"
license=("MIT")
arch=("x86_64")
provides=("rustscan")
options=("strip")
source=("https://github.com/brandonskerritt/RustScan/releases/download/1.0.1/rustscan-1.0.1-x86_64.tar.gz")
sha256sums=("212618e9fa3bd1ffafc3cb64b4688c9fa8dec20c64d3a7e9008fbde3e76a5855")

package() {
    install -Dm755 rustscan -t "$pkgdir/usr/bin/"
}
