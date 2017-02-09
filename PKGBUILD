# Contributor: dongfengweixiao ( dongfengweixiao [at] gmail [dot] com )
#              mkdong ( mingkaidong [at] gmail [dot] com )
# Maintainer: mkdong ( mingkaidong [at] gmail [dot] com )

pkgname=ttf-adobe-heiti
pkgver=5.005
pkgrel=3
pkgdesc="One fonts of Adobe's AdobeHeitiStd.R style."
arch=('any')
license=('unknown')
url="http://www.adobe.com"
depends=('fontconfig')
install=ttf-adobe-heiti.install
source=("AdobeHeitiStd.otf::https://raw.githubusercontent.com/mingchen/mac-osx-chinese-fonts/master/Adobe%20Simple%20Chinese%20Fonts/AdobeHeitiStd-Regular.otf")
md5sums=('5243e300d7d927d35fe96ed82837d7ed')
noextract=("AdobeHeitiStd.otf")

package() {
  install -Dm644 ${srcdir}/AdobeHeitiStd.otf ${pkgdir}/usr/share/fonts/Adobe/AdobeHeitiStd.otf
}

