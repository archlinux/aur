# Maintainer: Jon Stelly < 967068+jonstelly at users.noreply.github.com >
pkgname=kubevpn-bin
pkgver=1.1.33
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

sha256sums_x86_64=('b176277de80fdbdccba2a21c544085e2a957159d2fca19371a0b7168d6cfbba3')
sha256sums_aarch64=('c8bc40a1d0fd518b07481288f94af9002e2c450cdb1620df003857f0e2a7d4fc')
sha256sums_armv7h=('c8bc40a1d0fd518b07481288f94af9002e2c450cdb1620df003857f0e2a7d4fc')

package() {
  install -Dm755 "${srcdir}/bin/kubevpn" "${pkgdir}/usr/bin/kubevpn"
}
