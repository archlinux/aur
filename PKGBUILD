# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=choose-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="Human-friendly and fast alternative to cut and (sometimes) awk, written in Rust"
arch=(x86_64)
url="https://github.com/theryangeary/choose"
license=(MIT)
provides=(choose)
conflicts=(choose choose-rust-git)
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/choose-x86_64-unknown-linux-gnu")
sha256sums=('be74d8432765c8474d067d7c7d4916d2100ad92e232c1e1381a4c4293f118945')
noextract=($pkgname-$pkgver)

package() {
    install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/choose"
}
