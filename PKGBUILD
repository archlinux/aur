# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Andrej Mihajlov <andrej@nymtech.net>

pkgname=nym-vpnc-bin
pkgver=2026.11.1
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
source_x86_64=("$url/releases/download/nym-vpn-v2026.11.1/nym-vpn-core-v2026.11.1_linux_x86_64.tar.gz")
source_aarch64=("$url/releases/download/nym-vpn-v2026.11.1/nym-vpn-core-v2026.11.1_linux_aarch64.tar.gz")
sha256sums_x86_64=(d3d9da510404e731c3cc53865b37cce4b2e85bbeec43a082702bff4451f46c3e)
sha256sums_aarch64=(076d4a6ecd5a2f5d1f4d9f3b80f02f6d01f03c492861c2f131fdb078560d159a)

package() {
  install -Dm755 "nym-vpn-core-v2026.11.1_linux_${CARCH}/nym-vpnc" "$pkgdir/usr/bin/nym-vpnc"
}
