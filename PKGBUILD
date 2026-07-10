# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Andrej Mihajlov <andrej@nymtech.net>

pkgname=nym-vpnc-bin
pkgver=2026.11.0
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
source_x86_64=("$url/releases/download/nym-vpn-v2026.11.0/nym-vpn-core-v2026.11.0_linux_x86_64.tar.gz")
source_aarch64=("$url/releases/download/nym-vpn-v2026.11.0/nym-vpn-core-v2026.11.0_linux_aarch64.tar.gz")
sha256sums_x86_64=(29a186c9ceb07a37d976517718188bf5fd510d5779ccdf93738f12859450add6)
sha256sums_aarch64=(1cadfdb7edf878b3bed24ba09d919210140941ec21511470ed4ce150187fe8a3)

package() {
  install -Dm755 "nym-vpn-core-v2026.11.0_linux_${CARCH}/nym-vpnc" "$pkgdir/usr/bin/nym-vpnc"
}
