# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>
pkgname=auto-epp-go
pkgver=0.0.2
pkgrel=1
epoch=
pkgdesc="Program that automatically manages the EPP of your AMD CPU using the AMD-Pstate driver"
arch=("x86_64")
url="https://github.com/tfkhdyt/auto-epp-go"
license=('GPL3')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=("auto-epp")
replaces=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/tfkhdyt/$pkgname/releases/download/v$pkgver/auto-epp-go-v$pkgver-linux-amd64.tar.gz")
md5sums=("SKIP")

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ./auto-epp-go "$pkgdir/usr/bin/auto-epp-go"
	install -Dm644 ./auto-epp-go.service -t "$pkgdir/usr/lib/systemd/system"
}
