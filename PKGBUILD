# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Andrej Mihajlov <andrej@nymtech.net>

pkgname=nym-vpnc-bin
pkgver=2026.10.0
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
source_x86_64=("$url/releases/download/nym-vpn-core-v2026.10.0/nym-vpn-core-v2026.10.0_linux_x86_64.tar.gz")
source_aarch64=("$url/releases/download/nym-vpn-core-v2026.10.0/nym-vpn-core-v2026.10.0_linux_aarch64.tar.gz")
sha256sums_x86_64=(939ab832dc224b627c43b6c2a562073ba5dbcd530579abe3be13ad1fd2136c9b)
sha256sums_aarch64=(9c42007b9f7a9be8abba1d85105db5d22f1298dab1a10e8e8502515f3f51efa1)

package() {
  install -Dm755 "nym-vpn-core-v2026.10.0_linux_${CARCH}/nym-vpnc" "$pkgdir/usr/bin/nym-vpnc"
}
