# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
pkgname=wasm-tools
pkgver=1.0.55
pkgrel=1
pkgdesc="Low level tooling for WebAssembly in Rust"
arch=("x86_64")
url="https://github.com/bytecodealliance/wasm-tools"
license=("Apache")
depends=("glibc" "gcc-libs")
makedepends=("rust" "cargo")
source=("https://github.com/bytecodealliance/$pkgname/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=("bada1fc4b4f10532d6ba7bc453f535385204fa384e27f229368e3936d5da4a7e")

build() {
	cd "$pkgname-$pkgname-$pkgver"
	cargo build --release
}

package() {
	install -Dm755 "$pkgname-$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

