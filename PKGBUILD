# Contributor: dongfengweixiao ( dongfengweixiao [at] gmail [dot] com )
#              mkdong ( mingkaidong [at] gmail [dot] com )
# Maintainer: mkdong ( mingkaidong [at] gmail [dot] com )

pkgname=ttf-adobe-fangsong
pkgver=5.010
pkgrel=1
pkgdesc="One fonts of Adobe's AdobeFangsongStd.R style."
arch=('any')
license=('unknown')
url="http://www.adobe.com"
depends=('fontconfig')
install=ttf-adobe-fangsong.install
source=("AdobeFangsongStd.otf::https://raw.githubusercontent.com/mingchen/mac-osx-chinese-fonts/master/Adobe%20Simple%20Chinese%20Fonts/AdobeFangsongStd-Regular%20(v5.010).otf")
md5sums=('b811e3430d85638dae9a4f2f05fffc4a')
noextract=('AdobeFangsongStd.otf')

package () {
  install -Dm644 ${srcdir}/AdobeFangsongStd.otf ${pkgdir}/usr/share/fonts/Adobe/AdobeFangsongStd.otf
}
