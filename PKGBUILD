# Maintainer: Jon Stelly < 967068+jonstelly at users.noreply.github.com >
# Contributor: Dino Morelli < dino AT ui3 DOT info >
pkgname=kubevpn-bin
pkgver=2.2.15
pkgrel=2
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

sha256sums_x86_64=('57d61f999756468fca97512cab0266bb421ab8d617308a5defc29d56aea15f89')
sha256sums_aarch64=('aac7d50f2b528e88c4e1b9096dc179a317e3a66e495ee25cb024c42bfa75a31a')
sha256sums_armv7h=('aac7d50f2b528e88c4e1b9096dc179a317e3a66e495ee25cb024c42bfa75a31a')

package() {
  install -Dm755 "${srcdir}/bin/kubevpn" "${pkgdir}/usr/bin/kubevpn"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/kubevpn-bin/LICENSE"
}
