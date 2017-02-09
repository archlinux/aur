# Contributor: dongfengweixiao ( dongfengweixiao [at] gmail [dot] com )
#              mkdong ( mingkaidong [at] gmail [dot] com )
# Maintainer: mkdong ( mingkaidong [at] gmail [dot] com )

pkgname=ttf-adobe-kaiti
pkgver=5.010
pkgrel=1
pkgdesc="One fonts of Adobe's AdobeKaitiStd.R style."
arch=('any')
license=('unknown')
url="http://www.adobe.com"
depends=('fontconfig')
install=ttf-adobe-kaiti.install
source=("AdobeKaitiStd.otf::https://raw.githubusercontent.com/mingchen/mac-osx-chinese-fonts/master/Adobe%20Simple%20Chinese%20Fonts/AdobeKaitiStd-Regular%20(v5.010).otf")
md5sums=('0921cc969cb7c0ee78a40031bed0ab0b')
noextract=('AdobeKaitiStd.otf')

package () {
  install -Dm644 ${srcdir}/AdobeKaitiStd.otf ${pkgdir}/usr/share/fonts/Adobe/AdobeKaitiStd.otf
}
