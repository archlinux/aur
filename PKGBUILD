# Maintainer: Lēctia (Eden) Landau <lectia@wizard.enterprises>
pkgname=anywherelan-tray-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="Peer-to-peer mesh VPN and socks5 proxy (tray/desktop version, prebuilt)"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/anywherelan/awl"
license=('MIT')
provides=('anywherelan-tray')
conflicts=('anywherelan-tray')
source_x86_64=("awl-tray-linux-amd64-v$pkgver.tar.gz::https://github.com/anywherelan/awl/releases/download/v$pkgver/awl-tray-linux-amd64-v$pkgver.tar.gz")
source_aarch64=("awl-tray-linux-arm64-v$pkgver.tar.gz::https://github.com/anywherelan/awl/releases/download/v$pkgver/awl-tray-linux-arm64-v$pkgver.tar.gz")
source_armv7h=("awl-tray-linux-arm-v$pkgver.tar.gz::https://github.com/anywherelan/awl/releases/download/v$pkgver/awl-tray-linux-arm-v$pkgver.tar.gz")
source_i686=("awl-tray-linux-386-v$pkgver.tar.gz::https://github.com/anywherelan/awl/releases/download/v$pkgver/awl-tray-linux-386-v$pkgver.tar.gz")
sha256sums_x86_64=("ba9eeae0eef040e9ad5aaa3eefc93dd6b5c6397ed3ab9077a5b2b797f518ee13")
sha256sums_aarch64=("0b9cb60487169be82be9b3167e8a28b951d9b1221486fa4ab16e07804e271084")
sha256sums_armv7h=("0ee532cbbfc087bf443e37b5ef300f0f2b7174bdf13fcdd561034f66bce29136")
sha256sums_i686=("524a1d9c985067ec316ec45ea1871d3ba41ca144830bfe3af52749f700239918")

package() {
  install -Dm755 awl-tray "$pkgdir/usr/bin/awl-tray"
}





