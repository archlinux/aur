# Contributor: dongfengweixiao ( dongfengweixiao [at] gmail [dot] com )
#              initrdmk ( initrdmk [at] gmail [dot] com )
# Maintainer: initrdmk ( initrdmk [at] gmail [dot] com )

pkgname=ttf-adobe-kaiti
pkgver=5.004
pkgrel=2
pkgdesc="One fonts of Adobe's AdobeKaitiStd.R style."
arch=('any')
license=('unknown')
url="http://www.adobe.com"
depends=('fontconfig')
install=ttf-adobe-kaiti.install
source=('http://gthemes-china.googlecode.com/files/AdobeKaitiStd.tar.gz')
md5sums=('b37c29aafb8b80bd89f9c95cdd7097b5')

package () {
  install -Dm644 ${srcdir}/AdobeKaitiStd.otf ${pkgdir}/usr/share/fonts/Adobe/AdobeKaitiStd.otf
}
