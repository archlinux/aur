# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Andrej Mihajlov <andrej@nymtech.net>

pkgname=nym-vpnc-bin
pkgver=2026.13.0
pkgrel=1
pkgdesc='NymVPN command-line client'
arch=('x86_64' 'aarch64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'polkit' 'nym-vpnd')
makedepends=()
provides=('nym-vpnc')
conflicts=('nym-vpnc')
options=(!debug)
source_x86_64=("$url/releases/download/nym-vpn-v2026.13.0/nym-vpn-core-v2026.13.0_linux_x86_64.tar.gz")
source_aarch64=("$url/releases/download/nym-vpn-v2026.13.0/nym-vpn-core-v2026.13.0_linux_aarch64.tar.gz")
sha256sums_x86_64=(b118acc5c5b1de49c079558d27674f6bea751a13e00e81e6831d0c2d95ccd5be)
sha256sums_aarch64=(193df821712f5f738c0ce464e67305f456e44258b1006a574e0001b0571ae870)

package() {
  install -Dm755 "nym-vpn-core-v2026.13.0_linux_${CARCH}/nym-vpnc" "$pkgdir/usr/bin/nym-vpnc"
}
