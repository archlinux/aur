# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>
pkgname=auto-epp-rs
pkgver=0.0.3
pkgrel=3
epoch=
pkgdesc="Program that automatically manages the EPP of your AMD CPU using the AMD-Pstate driver (Rewritten in Rust)"
arch=("x86_64")
url="https://github.com/tfkhdyt/auto-epp-rs"
license=('GPL3')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=("auto-epp" "auto-epp-go")
replaces=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/tfkhdyt/$pkgname/releases/download/v$pkgver-$pkgrel/auto-epp-rs-v$pkgver-$pkgrel.tar.gz")
md5sums=("SKIP")

package() {
	install -Dm755 ./auto-epp-rs "$pkgdir/usr/bin/auto-epp-rs"
	install -Dm644 ./auto-epp-rs.service -t "$pkgdir/usr/lib/systemd/system"
}
