# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=openclipart-svg
pkgver=0.18
pkgrel=2
pkgdesc="Collection of 100% license-free, royalty-free, and restriction-free art"
url="https://openclipart.org"
arch=('any')
license=('custom:public domain')
options=(!strip !zipman)
source=(http://pkgs.fedoraproject.org/repo/pkgs/openclipart/openclipart-0.18-svgonly.tar.bz2/84e6ee889c8eb1208904e8e6f7004e63/openclipart-0.18-svgonly.tar.bz2)
md5sums=('84e6ee889c8eb1208904e8e6f7004e63')

package() {
  install -d ${pkgdir}/usr/share/{licenses/$pkgname,openclipart/svg}
  cd openclipart-${pkgver}-svgonly
  cp -r clipart/* "${pkgdir}/usr/share/openclipart/svg"
  cp LICENSE "${pkgdir}/usr/share/licenses/$pkgname"
}
