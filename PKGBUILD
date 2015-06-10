# Maintainer:  jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=openasb-server
pkgver=0.8
pkgrel=1
pkgdesc="Software to manage LAN-House and Cyber ​​Café (Server)."
arch=('any')
url="http://www.openasb.com"
license=('GPL v2')
# provides=('')
# conflicts=('')
depends=('gambas3-gb-image>=3.5' 'gambas3-gb-image<=3.99.0' 'gambas3-gb-qt4>=3.5' 'gambas3-gb-qt4<=3.99.0' 'gambas3-gb-form>=3.5' 'gambas3-gb-form<=3.99.0' 'gambas3-gb-crypt>=3.5' 'gambas3-gb-crypt<=3.99.0' 'gambas3-gb-db>=3.5' 'gambas3-gb-db<=3.99.0' 'gambas3-gb-db-form>=3.5' 'gambas3-gb-db-form<=3.99.0' 'gambas3-gb-desktop>=3.5' 'gambas3-gb-desktop<=3.99.0' 'gambas3-gb-form-dialog>=3.5' 'gambas3-gb-form-dialog<=3.99.0' 'gambas3-gb-settings>=3.5' 'gambas3-gb-settings<=3.99.0' 'gambas3-gb-net>=3.5' 'gambas3-gb-net<=3.99.0' 'gambas3-gb-net-curl>=3.5' 'gambas3-gb-net-curl<=3.99.0' 'gambas3-gb-qt4-ext>=3.5' 'gambas3-gb-qt4-ext<=3.99.0' 'gambas3-gb-qt4-webkit>=3.5' 'gambas3-gb-qt4-webkit<=3.99.0' 'gambas3-gb-sdl-sound>=3.5' 'gambas3-gb-sdl-sound<=3.99.0' 'gambas3-gb-v4l>=3.5' 'gambas3-gb-v4l<=3.99.0' 'gambas3-gb-web>=3.5' 'gambas3-gb-web<=3.99.0' 'gambas3-gb-db-sqlite3>=3.5' 'gambas3-gb-db-sqlite3<=3.99.0' 'vinagre' 'wakeonlan')
md5sums=('4711e5424938970a414f317ec1ef669e') 
source=("$pkgname.deb"::'http://www.openasb.com/softwares/ubuntu/openasb_0.8.0-0ubuntu1_all.deb')


package() {

	cd "$srcdir/"
    
    	msg2 "  -> Extracting files..."
    	tar Jxvf  data.tar.xz -C .
    
    	msg2 "  -> Installing program..."
    	install -d $pkgdir/{usr/bin,usr/share}
    	cp -a "$srcdir/usr/bin/openasb" "$pkgdir/usr/bin/"
    
    	msg2 "  -> Installing icons..."
    	install -Dm644 "$srcdir/usr/share/pixmaps/openasb.png" "$pkgdir/usr/share/pixmaps/openasb.png"
    
    	msg2 "  -> Installing .desktop file..."
    	install -Dm644 "$srcdir/usr/share/applications/openasb.desktop" "$pkgdir/usr/share/applications/openasb.desktop"

}

# vim: ts=2 sw=2 et: