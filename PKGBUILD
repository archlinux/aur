# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
pkgname=wasm-tools
pkgver=1.0.60
pkgrel=1
pkgdesc="Low level tooling for WebAssembly in Rust"
arch=("x86_64")
url="https://github.com/bytecodealliance/wasm-tools"
license=("Apache")
depends=("glibc" "gcc-libs")
makedepends=("rust" "cargo")
source=("https://github.com/bytecodealliance/$pkgname/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=("397fdfbcc3d1352291250d89d5caad8c8d50a6b1d22d14ed7b74a247ce08ff31")

build() {
	cd "$pkgname-$pkgname-$pkgver"
	cargo build --release
}

package() {
	install -Dm755 "$pkgname-$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

