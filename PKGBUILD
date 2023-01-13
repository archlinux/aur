# Maintainer: Funami
pkgname=fdroidcl-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="F-Droid desktop client"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/mvdan/fdroidcl"
license=('BSD')
provides=('fdroidcl')
conflicts=('fdroidcl')
source=("https://raw.githubusercontent.com/mvdan/fdroidcl/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/mvdan/fdroidcl/releases/download/v${pkgver}/fdroidcl_v${pkgver}_linux_amd64")
source_i686=("${pkgname}-${pkgver}-i686::https://github.com/mvdan/fdroidcl/releases/download/v${pkgver}/fdroidcl_v${pkgver}_linux_386")
source_armv7h=("${pkgname}-${pkgver}-armv7h::https://github.com/mvdan/fdroidcl/releases/download/v${pkgver}/fdroidcl_v${pkgver}_linux_armv7_gnueabihf")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/mvdan/fdroidcl/releases/download/v${pkgver}/fdroidcl_v${pkgver}_linux_arm64")
sha256sums=('6b44db2e2b57c1f8a3b44f105650813bbef494e0472cb76620d4dfbffd96f988')
sha256sums_x86_64=('de155d96ec2b5accbd282d9b557dea4b82c712db9a2f409e039417780d46124f')
sha256sums_i686=('a267454ef54492d6234e0b22dc8f0702075c5487846021acd3c3a49943c1604d')
sha256sums_armv7h=('f2a02d2d9effa1d77fd2f87df08eb1f294e562da912700cde3733766d9fa9d9b')
sha256sums_aarch64=('39e5804f9d5904cf1a5166d7a88e85ace12605e6daec794d5ef79a1966aaf79e')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/fdroidcl"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/fdroidcl"
}
