# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=openclipart-svg
pkgver=0.18
pkgrel=1
pkgdesc="Collection of 100% license-free, royalty-free, and restriction-free art"
url="https://openclipart.org"
arch=('any')
license=('custom:public domain')
options=(!strip !zipman)
source=(http://ftp.osuosl.org/pub/openclipart/downloads/${pkgver}/openclipart-${pkgver}-svgonly.zip)
md5sums=('0a437997fc0fb85ec77b0753d04c258c')

package() {
  install -d ${pkgdir}/usr/share/{licenses/$pkgname,openclipart/svg}
  cd openclipart-${pkgver}-svgonly
  cp -r clipart/* "${pkgdir}/usr/share/openclipart/svg"
  cp LICENSE "${pkgdir}/usr/share/licenses/$pkgname"
}