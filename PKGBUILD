# Maintainer: Rayr https://rayr.ml/LinkInBio/
pkgname=discord-rpc-cli-git
pkgver=1.1.1
pkgrel=2
pkgdesc="A Discord RPC cli client written purely in Rust"
arch=(any)
url="https://github.com/Rayrsn/Discord-RPC-cli"
license=('GPL')
makedepends=('rust')
source=("https://github.com/Rayrsn/Discord-RPC-cli/archive/refs/tags/V$pkgver.zip")
md5sums=(SKIP)
build() {
    cd "Discord-RPC-cli-$pkgver"
    cargo build --release
}

package() {
	cd "Discord-RPC-cli-$pkgver"
	install -Dm755 "target/release/discord-rpc-cli" "$pkgdir/usr/bin/discord-rpc-cli"

}
