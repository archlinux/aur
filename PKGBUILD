pkgname=system-san-francisco-font-git
pkgver=1.0
pkgrel=1
pkgdesc="System San Francisco Font -- will show as 'SFNS Display' in font dialogs"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=("git://github.com/supermarin/YosemiteSanFranciscoFont.git")
install=$pkgname.install

package() {
	cd $srcdir/YosemiteSanFranciscoFont
	find . -iname "System San Francisco Display *.ttf" -execdir install -Dm644 {} $pkgdir/usr/share/fonts/TTF/{} \;
    }
md5sums=('SKIP')
