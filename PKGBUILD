# Maintainer: Rayr https://rayr.ml/LinkInBio/
pkgname=discord-rpc-cli-git
pkgver=1.2.1
pkgrel=1
pkgdesc="A Discord RPC cli client written purely in Rust"
arch=(any)
url="https://github.com/Rayrsn/Discord-RPC-cli"
license=('GPL')
makedepends=('rust')
source=("https://github.com/Rayrsn/Discord-RPC-cli/archive/refs/tags/V$pkgver.zip")
md5sums=('4ed57f745719e4b21165f9482a8714ca')
build() {
    cd "Discord-RPC-cli-$pkgver"
    cargo build --release
}

package() {
	cd "Discord-RPC-cli-$pkgver"
	install -Dm755 "target/release/discord-rpc-cli" "$pkgdir/usr/bin/discord-rpc-cli"

}
