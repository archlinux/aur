# Contributor: dongfengweixiao ( dongfengweixiao [at] gmail [dot] com )
#              mkdong ( mingkaidong [at] gmail [dot] com )
# Maintainer: mkdong ( mingkaidong [at] gmail [dot] com )

pkgname=ttf-adobe-song
pkgver=5.002
pkgrel=3
pkgdesc="One fonts of Adobe's AdobeSongStd.L style."
arch=('any')
license=('unknown')
url="http://www.adobe.com"
depends=('fontconfig')
install=ttf-adobe-song.install
source=("AdobeSongStd.otf::https://raw.githubusercontent.com/mingchen/mac-osx-chinese-fonts/master/Adobe%20Simple%20Chinese%20Fonts/AdobeSongStd-Light.otf")
md5sums=('ea2acdec4b71f834e158fd260bd15453')
noextract=("AdobeSongStd.otf")

package () {
  install -Dm644 ${srcdir}/AdobeSongStd.otf ${pkgdir}/usr/share/fonts/Adobe/AdobeSongStd.otf
}
