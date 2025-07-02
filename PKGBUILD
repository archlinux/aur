# Maintainer: Funami
pkgname=fdroidcl-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="F-Droid desktop client"
arch=('x86_64' 'aarch64')
url="https://github.com/mvdan/fdroidcl"
license=('BSD')
depends=('android-tools')
provides=('fdroidcl')
conflicts=('fdroidcl')
source=("https://raw.githubusercontent.com/mvdan/fdroidcl/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/mvdan/fdroidcl/releases/download/v${pkgver}/fdroidcl_v${pkgver}_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/mvdan/fdroidcl/releases/download/v${pkgver}/fdroidcl_v${pkgver}_linux_arm64")
sha256sums=('6b44db2e2b57c1f8a3b44f105650813bbef494e0472cb76620d4dfbffd96f988')
sha256sums_x86_64=('7d1feba37d2663e3e28d8b1be8ace874ca2a8c3a03ff4c0df5b8aed842d0b5d5')
sha256sums_aarch64=('6e7a35d57b326c077790dcb3dffad6f89ded44886eb101ee7200b9f1dc1ca749')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/fdroidcl"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/fdroidcl"
}
