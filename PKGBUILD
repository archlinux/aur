

pkgname=xcursor-chameleon-skyblue
pkgver=0.5
pkgrel=2
pkgdesc="Chameleon X Cursor Theme (skyblue flavour)"
arch=('any')
url="http://www.kde-look.org/content/show.php?content=38459"
license=('GPL')
depends=('libxcursor')
source=(http://www.egregorion.net/works/chameleon/Chameleon-SkyBlue-0.5.tar.bz2) 
md5sums=('419dedab04bca3a729e14083710b6810')

package() {
	mkdir -p "${pkgdir}"/usr/share/icons/{Chameleon-SkyBlue-Large,Chameleon-SkyBlue-Regular,Chameleon-SkyBlue-Small}
	cp -R "${srcdir}"/Chameleon-SkyBlue-Large-0.5/{cursors,index.theme} "${pkgdir}"/usr/share/icons/Chameleon-SkyBlue-Large
	cp -R "${srcdir}"/Chameleon-SkyBlue-Regular-0.5/{cursors,index.theme} "${pkgdir}"/usr/share/icons/Chameleon-SkyBlue-Regular
	cp -R "${srcdir}"/Chameleon-SkyBlue-Small-0.5/{cursors,index.theme} "${pkgdir}"/usr/share/icons/Chameleon-SkyBlue-Small
}
