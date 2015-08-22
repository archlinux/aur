# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=ttf-jozoor
pkgver=1.0
pkgrel=4
pkgdesc="Arabic fonts designed by Jozoor Team, working on Linux, Mac and Windows"
arch=('any')
url="http://jozoor.com/"
license=('CCPL:by-sa')
install=font.install
source=(http://download1388.mediafire.com/dr4zt852i3ng/xcvmc8nbjjrzsh7/Jozoor_Font.zip
	https://dl.dropboxusercontent.com/u/34057974/Free_Jozoor_Fonts/Flat_Font_Jozoor.zip)
sha256sums=('be60907957909b6bbe9385ef475d6c27d9f7ac11b9b596112b0a1613c849b49f'
	    '076da74e0df2637d7f7c654ae595c1c27cf2308d87dd81df0b18964ede4177c6')

package() {
  cd "$srcdir/Jozoor_Font"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.otf "$pkgdir/usr/share/fonts/TTF"

  cd "$srcdir/Flat_Font_Jozoor/Font/otf"
  install -Dm644 *.otf "$pkgdir/usr/share/fonts/TTF"
}
