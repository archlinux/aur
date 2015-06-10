# Contributor: dongfengweixiao ( dongfengweixiao [at] gmail [dot] com )
#              initrdmk ( initrdmk [at] gmail [dot] com )
# Maintainer: initrdmk ( initrdmk [at] gmail [dot] com )

pkgname=ttf-adobe-heiti
pkgver=5.005
pkgrel=2
pkgdesc="One fonts of Adobe's AdobeHeitiStd.R style."
arch=('any')
license=('unknown')
url="http://www.adobe.com"
depends=('fontconfig')
install=ttf-adobe-heiti.install
source=('http://gthemes-china.googlecode.com/files/AdobeHeitiStd.tar.gz')
md5sums=('598e5c354679c2ed46ea64f23417b83a')

package() {
  install -Dm644 ${srcdir}/AdobeHeitiStd.otf ${pkgdir}/usr/share/fonts/Adobe/AdobeHeitiStd.otf
}
