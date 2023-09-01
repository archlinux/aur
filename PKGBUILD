# Maintainer: Jon Stelly < 967068+jonstelly at users.noreply.github.com >
pkgname=kubevpn-bin
pkgver=1.1.36
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

sha256sums_x86_64=('5945245f1904619da3f98134555f32910218acfe4c151d7131561d99188de455')
sha256sums_aarch64=('38476c1041672ebba15cd5a8a51be7ca6faf01b2c586ff8c196c6d6d3b21684a')
sha256sums_armv7h=('38476c1041672ebba15cd5a8a51be7ca6faf01b2c586ff8c196c6d6d3b21684a')

package() {
  install -Dm755 "${srcdir}/bin/kubevpn" "${pkgdir}/usr/bin/kubevpn"
}
