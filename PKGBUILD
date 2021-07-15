# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=choose-bin
pkgver=1.3.2
pkgrel=1
pkgdesc="Human-friendly and fast alternative to cut and (sometimes) awk, written in Rust"
arch=(x86_64)
url="https://github.com/theryangeary/choose"
license=(MIT)
provides=(choose)
conflicts=(choose choose-rust-git)
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/choose-x86_64-unknown-linux-gnu")
sha256sums=('a4391b13307266c79e533ad26439e066930cd8f8e3b1e81bf71c2289de2fe766')
noextract=($pkgname-$pkgver)

package() {
    install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/choose"
}
