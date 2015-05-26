# Contributor: Schala Zeal <schalaalexiazeal@gmail.com>
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

## Uploaded with permission from the author ##

pkgname=pony-creator
pkgver=v3
pkgrel=1
pkgdesc="Create your own pony character inspired by My Little Pony: Friendship is Magic (Flash game)"
arch=(any)
url="http://generalzoi.deviantart.com/art/Pony-Creator-v3-397808116"
license=("unknown")
depends=("flashplayer-standalone>=10")
source=("Pony-creator.swf::http://fc03.deviantart.com/fs71/f/2013/245/2/9/298852eef0c2257d49084ad7dbea67a8-d6kuepg.swf"
	"pony-creator.png"
	"pony-creator.desktop"
	"pony-creator.sh")

package() {
  install -Dm644 "${srcdir}/Pony-creator.swf" "${pkgdir}/usr/share/games/${pkgname}/Pony-Creator-v3.swf"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/pony-creator.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
}

md5sums=('e91c4507d0ac624739f72253a81fd500'
         '50718b321060ad225712da27900dd2e6'
         '3316779fcd080b8eb067c261262a3929'
         '40777f3b610db65dec21d52e6ec98b5e')
