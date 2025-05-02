# Maintainer: Funami
pkgname=fdroidcl-bin
pkgver=0.8.0
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
sha256sums_x86_64=('7ef0ca8c62f9775602e3c392d036950e4a437614c099cc734dcee783f198ad03')
sha256sums_aarch64=('30aa1328144be5111c8b9fb0160529ec3523ac2c201cf88fe4494586dee49d42')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/fdroidcl"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/fdroidcl"
}
