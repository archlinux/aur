# Maintainer: Wenrui Huang <wr-huang@outlook.com>

pkgname=njuconnect
pkgver=14
pkgrel=1
pkgdesc="NJUConnect - A cross-platform VPN client for Nanjing University"
arch=('x86_64')
url="https://github.com/lyc8503/NJUConnect"
license=('unknown')
depends=()
makedepends=()
source=("njuconnect-${pkgver}::https://github.com/lyc8503/NJUConnect/releases/download/TestBuild${pkgver}/EasierConnect-linux-amd64.zip")
sha256sums=('9a686c3861a04132ce7b14fd240550e88f60e2b0f5d4fc1186519aa9bd2735ba')

package() {
  install -Dm755 "EasierConnect" "${pkgdir}/usr/bin/njuconnect"
}
