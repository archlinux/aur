# Contributor: dongfengweixiao ( dongfengweixiao [at] gmail [dot] com )
#              initrdmk ( initrdmk [at] gmail [dot] com )
# Maintainer: initrdmk ( initrdmk [at] gmail [dot] com )

pkgname=ttf-adobe-song
pkgver=5.002
pkgrel=2
pkgdesc="One fonts of Adobe's AdobeSongStd.L style."
arch=('any')
license=('unknown')
url="http://www.adobe.com"
depends=('fontconfig')
install=ttf-adobe-song.install
source=('http://gthemes-china.googlecode.com/files/AdobeSongStd.tar.gz')
md5sums=('dfb255e52b55d5ecd2343a5f5465740e')

package () {
  install -Dm644 ${srcdir}/AdobeSongStd.otf ${pkgdir}/usr/share/fonts/Adobe/AdobeSongStd.otf
}
