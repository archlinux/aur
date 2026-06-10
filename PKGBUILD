# Maintainer: Lēctia (Eden) Landau <lectia@wizard.enterprises>
pkgname=anywherelan-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="Peer-to-peer mesh VPN and socks5 proxy (CLI/server version, prebuilt)"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/anywherelan/awl"
license=('MIT')
provides=('anywherelan')
conflicts=('anywherelan')
source_x86_64=("awl-linux-amd64-v$pkgver.tar.gz::https://github.com/anywherelan/awl/releases/download/v$pkgver/awl-linux-amd64-v$pkgver.tar.gz")
source_aarch64=("awl-linux-arm64-v$pkgver.tar.gz::https://github.com/anywherelan/awl/releases/download/v$pkgver/awl-linux-arm64-v$pkgver.tar.gz")
source_armv7h=("awl-linux-arm-v$pkgver.tar.gz::https://github.com/anywherelan/awl/releases/download/v$pkgver/awl-linux-arm-v$pkgver.tar.gz")
source_i686=("awl-linux-386-v$pkgver.tar.gz::https://github.com/anywherelan/awl/releases/download/v$pkgver/awl-linux-386-v$pkgver.tar.gz")
sha256sums_x86_64=("b671eac59d0e7e21b694e5b627f378d2e74c9cdf81e6f93d5fff4ab888dbf20f")
sha256sums_aarch64=("216ae7bb5144eab8caf13dfaa5d43be7931cfebcd631eafdec9e58cf8f73ca67")
sha256sums_armv7h=("2541ff08c80ac740e09d291fa6fa364063d93a48397e1d354fa8ed9ba54d57fd")
sha256sums_i686=("71d6b53674dae89a000082b25ff6c4df04611bb3c4806b860ebe72987e7e02ec")

package() {
  install -Dm755 awl "$pkgdir/usr/bin/awl"
}
