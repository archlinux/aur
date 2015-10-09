# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
pkgname=copy-agent-dark-icons
pkgver=0.1
pkgrel=1
depends=('copy-agent')
pkgdesc='Copy.com sync agent monochrome dark icons'
arch=('any')
url='www.copy.com'
license=('GPL')
source=("copy.svg::https://copy.com/eyykUpEGKdEelWgh" "copy-agent.svg::https://copy.com/beTJ0o7JCa3DUATE")
sha256sums=('7c4ef6b397218f1bf84e59d011ee8dcf0a55d2b25c3b89cfa3a64d2c97592dd3'
            '1849eae0d9ac5ed57a4bb841f14b3ea56925295bdfc6b01763a4ce54679bfe47')

package() {
  cd ${srcdir}
  install -dm755 ${pkgdir}/usr/share/icons/hicolor/scalable/apps/
  
  install -m644 copy.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/
  install -m644 copy-agent.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/
}
