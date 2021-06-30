# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=choose-bin
pkgver=1.3.1
pkgrel=2
pkgdesc="Human-friendly and fast alternative to cut and (sometimes) awk, written in Rust"
arch=(x86_64)
url="https://github.com/theryangeary/choose"
license=(MIT)
provides=(choose)
conflicts=(choose choose-rust-git)
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/choose")
sha256sums=('ad65b6aae2d928a03bc18549f55cc0a39005297d3ee05725fd504168230a3b39')
noextract=($pkgname-$pkgver)

package() {
    install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/choose"
}
