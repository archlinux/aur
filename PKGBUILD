# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Andrej Mihajlov <andrej@nymtech.net>

pkgname=nym-vpnc-bin
pkgver=2026.11.2
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
source_x86_64=("$url/releases/download/nym-vpn-v2026.11.2/nym-vpn-core-v2026.11.2_linux_x86_64.tar.gz")
source_aarch64=("$url/releases/download/nym-vpn-v2026.11.2/nym-vpn-core-v2026.11.2_linux_aarch64.tar.gz")
sha256sums_x86_64=(933d223436fcd7dff7785723ab7726297e806629f1d325db8fa3f8a1a8229cbb)
sha256sums_aarch64=(32cae6db84444b86f6eb5d69fc5fc468c4b9fbe5df0875fbbd956c43a915014b)

package() {
  install -Dm755 "nym-vpn-core-v2026.11.2_linux_${CARCH}/nym-vpnc" "$pkgdir/usr/bin/nym-vpnc"
}
