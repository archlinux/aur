# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Andrej Mihajlov <andrej@nymtech.net>

pkgname=nym-vpnc-bin
pkgver=2026.12.2
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
source_x86_64=("$url/releases/download/nym-vpn-v2026.12.2/nym-vpn-core-v2026.12.2_linux_x86_64.tar.gz")
source_aarch64=("$url/releases/download/nym-vpn-v2026.12.2/nym-vpn-core-v2026.12.2_linux_aarch64.tar.gz")
sha256sums_x86_64=(388d79cd22ff6af3e29350b83ab5a7e7c625cf53b751a3657a213ee21452b2ae)
sha256sums_aarch64=(1f9f0c577f4869b6d55c9ae16171c94676c57da321367c642e055b3ee2e3dc5c)

package() {
  install -Dm755 "nym-vpn-core-v2026.12.2_linux_${CARCH}/nym-vpnc" "$pkgdir/usr/bin/nym-vpnc"
}
