# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Andrej Mihajlov <andrej@nymtech.net>

pkgname=nym-vpnc-bin
pkgver=2026.11.3
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
source_x86_64=("$url/releases/download/nym-vpn-v2026.11.3/nym-vpn-core-v2026.11.3_linux_x86_64.tar.gz")
source_aarch64=("$url/releases/download/nym-vpn-v2026.11.3/nym-vpn-core-v2026.11.3_linux_aarch64.tar.gz")
sha256sums_x86_64=(32d9d9671cce5844df96174a61d27cfbe9138088c4e17baa7834c24d9c3eef04)
sha256sums_aarch64=(5535c9888f53c80fcd62effbdde7f62a8ace93c1e15d71fe66bef90866803928)

package() {
  install -Dm755 "nym-vpn-core-v2026.11.3_linux_${CARCH}/nym-vpnc" "$pkgdir/usr/bin/nym-vpnc"
}
