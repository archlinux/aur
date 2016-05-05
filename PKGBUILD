# Maintainer: Philip Müller <philm@manjaro.org>
# Contributor: Lane Wiscombe <assassin.anex@gmail.com>
# Submiter to AUR: Pablo Lezaeta <prflr 88 (arro'a) gmail puntocom>

pkgname=xcursor-maia
_gitname=maia-cursor
pkgver=20160417
pkgrel=1
pkgdesc="Cursor theme - part of the Manjaro Maia set"
arch=('any')
url="https://github.com/manjaro/$_gitname"
license=('GPL3')
depends=('libxcursor')
optdepends=("menda-icon-theme: Official icon theme"
	"menda-gtk-theme: Official theming")
makedepends=('binutils' 'git')
source=("git+$url.git"
	'thumbnail.png')
md5sums=('SKIP'
         '0a7352c3d38d4670fb38393ea4ac555c')

package() {
    mkdir -p $pkgdir/usr/share/icons
    cp -a $srcdir/maia-cursor/Maia-Cursor/ $pkgdir/usr/share/icons/
    cp $srcdir/thumbnail.png $pkgdir/usr/share/icons/Maia-Cursor/cursors/
}
