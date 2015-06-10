# Contributor: dongfengweixiao ( dongfengweixiao [at] gmail [dot] com )
#              initrdmk ( initrdmk [at] gmail [dot] com )
# Maintainer: initrdmk ( initrdmk [at] gmail [dot] com )

pkgname=ttf-adobe-fangsong
pkgver=5.004
pkgrel=2
pkgdesc="One fonts of Adobe's AdobeFangsongStd.R style."
arch=('any')
license=('unknown')
url="http://www.adobe.com"
depends=('fontconfig')
install=ttf-adobe-heiti.install
source=('http://gthemes-china.googlecode.com/files/AdobeFangsongStd.tar.gz')
md5sums=('422e9125821651fd9d1461eb30809167')

package () {
  install -Dm644 ${srcdir}/AdobeFangsongStd.otf ${pkgdir}/usr/share/fonts/Adobe/AdobeFangsongStd.otf
}
