# Maintainer: Jon Stelly < 967068+jonstelly at users.noreply.github.com >
# Contributor: Dino Morelli < dino AT ui3 DOT info >
pkgname=kubevpn-bin
pkgver=2.10.2
pkgrel=1
pkgdesc="Access kubernetes via VPN"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/KubeNetworks/kubevpn"
license=('MIT')
depends=()
optdepends=()
provides=('kubevpn')
conflicts=('kubevpn')

source_x86_64=("https://github.com/KubeNetworks/kubevpn/releases/download/v${pkgver}/kubevpn_v${pkgver}_linux_amd64.zip")
source_aarch64=("https://github.com/KubeNetworks/kubevpn/releases/download/v${pkgver}/kubevpn_v${pkgver}_linux_arm64.zip")
source_armv7h=("https://github.com/KubeNetworks/kubevpn/releases/download/v${pkgver}/kubevpn_v${pkgver}_linux_arm64.zip")

sha256sums_x86_64=('d9629704a540d9d174d32fc703202b34164e5784d42bd15e801ccd53909694b9')
sha256sums_aarch64=('b7c51f2090f9d4720b02b0619461dbc77c74da5c69cdc0e18498bf50c69d95da')
sha256sums_armv7h=('b7c51f2090f9d4720b02b0619461dbc77c74da5c69cdc0e18498bf50c69d95da')

package() {
  install -Dm755 "${srcdir}/bin/kubevpn" "${pkgdir}/usr/bin/kubevpn"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/kubevpn-bin/LICENSE"
}
