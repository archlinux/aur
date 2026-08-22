# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Andrej Mihajlov <andrej@nymtech.net>

pkgname=nym-vpnc-bin
pkgver=2026.12.1
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
source_x86_64=("$url/releases/download/nym-vpn-v2026.12.1/nym-vpn-core-v2026.12.1_linux_x86_64.tar.gz")
source_aarch64=("$url/releases/download/nym-vpn-v2026.12.1/nym-vpn-core-v2026.12.1_linux_aarch64.tar.gz")
sha256sums_x86_64=(74ede0d911ec624de57584f93fce98f442a173112aa4ba5b655c8422e99b2140)
sha256sums_aarch64=(8f29713555466e03881089629b2ade4f95e09e5c724a0811493d53380ca0e6fc)

package() {
  install -Dm755 "nym-vpn-core-v2026.12.1_linux_${CARCH}/nym-vpnc" "$pkgdir/usr/bin/nym-vpnc"
}
