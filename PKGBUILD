# Maintainer: Jon Stelly < 967068+jonstelly at users.noreply.github.com >
# Contributor: Dino Morelli < dino AT ui3 DOT info >
pkgname=kubevpn-bin
pkgver=2.2.16
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

sha256sums_x86_64=('411c325480d321b33e95b1f0644c5faa335af3c7b9e9ecf68f236a6345f0fc9a')
sha256sums_aarch64=('198cebbc31c2f4eb01e5cb32ea7fe04c6dd518e62944dbad8c4e2ff80ec6ffa5')
sha256sums_armv7h=('198cebbc31c2f4eb01e5cb32ea7fe04c6dd518e62944dbad8c4e2ff80ec6ffa5')

package() {
  install -Dm755 "${srcdir}/bin/kubevpn" "${pkgdir}/usr/bin/kubevpn"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/kubevpn-bin/LICENSE"
}
