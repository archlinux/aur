# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Andrej Mihajlov <andrej@nymtech.net>

pkgname=nym-vpnc-bin
pkgver=2026.12.4
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
source_x86_64=("$url/releases/download/nym-vpn-v2026.12.4/nym-vpn-core-v2026.12.4_linux_x86_64.tar.gz")
source_aarch64=("$url/releases/download/nym-vpn-v2026.12.4/nym-vpn-core-v2026.12.4_linux_aarch64.tar.gz")
sha256sums_x86_64=(17ec7c1d41395328aada6a71633ba11c9a152960d836f00ba6a9792fb0aa76a4)
sha256sums_aarch64=(cca9b7bf98aab43d481b5a3ad0098300ee08e3d2e11497b423a71457ab8b565a)

package() {
  install -Dm755 "nym-vpn-core-v2026.12.4_linux_${CARCH}/nym-vpnc" "$pkgdir/usr/bin/nym-vpnc"
}
