# Maintainer: pezcurrel <pezcurrel [at] tiscali.it>
# Contributor: Piotr Beling <qwak [at] stud.ics.p.lodz.pl>

pkgname=blockout2
pkgver=2.5
pkgrel=2
pkgdesc="3D tetris, free adaptation of the original BlockOut DOS game edited by California Dreams in 1989"
arch=("i686" "x86_64")
url="http://www.blockout.net/blockout2/"
depends=("libgl" "glu" "libxext" "sdl" "sdl_mixer")
license=("GPL")
source_x86_64=("http://downloads.sourceforge.net/project/blockout/blockout/BlockOut%202.5/bl25-linux-x64.tar.gz")
source_i686=("http://downloads.sourceforge.net/project/blockout/blockout/BlockOut%202.5/bl25-linux-x86.tar.gz")
source=("blockout2" "blockout2.desktop" "blockout2.ico")
md5sums_x86_64=("6155d0596d762852e3fbd1718d3d6455")
md5sums_i686=("6e29242d76cd5bbf8caee62127f02e19")
md5sums=("130e2c10b68b41bf12e67a764a2ea4fb"
	"c3d7d196e4af7fabd287376988376fe4"
	"8ca26c4748a20a75d3c290b18506308d")

package() {
   install -d "$pkgdir"/{opt,usr/bin,usr/share/applications,usr/share/pixmaps}
	chmod -x "$srcdir"/blockout/README.txt "$srcdir"/blockout/images/background.png "$srcdir"/blockout/sounds/music.ogg
	mv "$srcdir"/blockout "$pkgdir"/opt/blockout2
	cp -L "$srcdir"/blockout2 "$pkgdir"/usr/bin/
	cp -L blockout2.desktop "$pkgdir"/usr/share/applications/
	cp -L blockout2.ico "$pkgdir"/usr/share/pixmaps/
}
