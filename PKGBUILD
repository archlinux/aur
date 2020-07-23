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
source=("https://github.com/brandonskerritt/RustScan/releases/download/1.1.0/rustscan-1.1.0-x86_64.tar.gz")
sha256sums=("a471b2376df0d176a5daf83e6c47554cce3f7c7bf4aea914ac2e01219ccd4e72")

package() {
    install -Dm755 rustscan -t "$pkgdir/usr/bin/"
}
