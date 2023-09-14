# Maintainer: Jon Stelly < 967068+jonstelly at users.noreply.github.com >
pkgname=kubevpn-bin
pkgver=1.2.0
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

sha256sums_x86_64=('e86e5a64ad9c7da8b7bb2b35f85abdca0e2920394bc0b51255452942f2a9932b')
sha256sums_aarch64=('33139e7b01151bf9caca0d76c91ce6a9bc3632a752f2faba5bda7ed22895afd3')
sha256sums_armv7h=('33139e7b01151bf9caca0d76c91ce6a9bc3632a752f2faba5bda7ed22895afd3')

package() {
  install -Dm755 "${srcdir}/bin/kubevpn" "${pkgdir}/usr/bin/kubevpn"
}
