# Maintainer: Veld Authors <hello@veldmesh.io>
pkgname=veld
pkgver=0.1.0
pkgrel=1
pkgdesc="Zero-trust mesh VPN daemon and CLI"
arch=('x86_64' 'aarch64')
url="https://veldmesh.io"
license=('MIT')
provides=('veld' 'veld-daemon' 'veld-coord')
conflicts=()

source_x86_64=("${pkgname}-v${pkgver}-linux_amd64.tar.gz::https://github.com/veldmesh/veld/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux_amd64.tar.gz")
source_aarch64=("${pkgname}-v${pkgver}-linux_arm64.tar.gz::https://github.com/veldmesh/veld/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux_arm64.tar.gz")

# Update with: sha256sum veld-v<version>-linux_{amd64,arm64}.tar.gz
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 veld        "${pkgdir}/usr/bin/veld"
    install -Dm755 veld-daemon "${pkgdir}/usr/bin/veld-daemon"
    install -Dm755 veld-coord  "${pkgdir}/usr/bin/veld-coord"
}
