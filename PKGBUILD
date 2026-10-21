# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Fantix King <fantix.king@gmail.com>

pkgname=granted-bin
pkgver=0.40.0
pkgrel=1
pkgdesc="CLI tool that simplifies access to cloud roles in your web browser"
arch=(x86_64 i686 aarch64)
url="https://github.com/fwdcloudsec/granted"
license=(MIT)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/granted_${pkgver}_linux_x86_64.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/granted_${pkgver}_linux_i386.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/granted_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c55e2ccaf60ed810b5d389f558c9a48a35b356375d7fe6666b19b98695eda794')
sha256sums_i686=('978736eeafc8bcdbbd9aeeb80fb522cb5fbdaa56935303e0d249cf3bbac7aa62')
sha256sums_aarch64=('0da965ca9b8200ce75794be246677a2f15909a9a87db89a9dc512aecee09a55d')

package() {
    install -Dm755 granted assumego assume -t "$pkgdir/usr/bin/"
}
