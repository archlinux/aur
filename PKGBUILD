# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com

pkgname=zaproxy-desktop
pkgver=1
pkgrel=4
pkgdesc='Integrated penetration testing tool for finding vulnerabilities in web applications (desktop icon)'
arch=('any')
url='https://www.owasp.org/index.php/ZAP'
license=('Apache-2.0')
depends=('zaproxy')
source=(
  owasp-zap.desktop
  owasp-zap.png
)
sha512sums=(
  'd10f4df37421094fed7aa8d43f3232013bd64603985f3f45cd2788e3deb04c1f0e42f0219ae7385d0e1f5b8e282fe1cdc88d1cf716cc62a99722b543a2e38fdf'
  'c6d728937a7d60dd8d98f6134ea5cddddb6c55526329ae8c59c3245d5beaf4cc1dffe4239d71e683467be74f1541163c18226a4c776efe67649dfd9dd186994c'
)

package() {
  install -Dm 644 "${srcdir}"/owasp-zap.png -t "${pkgdir}"/usr/share/pixmaps/
  install -Dm 644 "${srcdir}"/owasp-zap.desktop -t "${pkgdir}"/usr/share/applications/
}

