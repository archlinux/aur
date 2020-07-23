# Maintainer: Bee <brandon@skerritt.blog>
pkgname=rustscan-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Faster Nmap Scanning with Rust"
url="https://github.com/brandonskerritt/rustscan"
license=("MIT")
arch=("x86_64")
provides=("rustscan")
options=("strip")
source=("https://github.com/brandonskerritt/RustScan/releases/download/1.1.0/rustscan-1.1.0-x86_64.tar.gz")
sha256sums=("0133e0ece8283e79f0c86de53ac5adb45444addbed3bc1db2d6bc1103529bd1c")

package() {
    install -Dm755 rustscan -t "$pkgdir/usr/bin/"
}
