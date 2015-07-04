
pkgname=xcursor-chameleon-darkskyblue
pkgver=0.5
pkgrel=2
pkgdesc="Chameleon X Cursor Theme (darkskyblue flavour)"
arch=('any')
url="http://www.kde-look.org/content/show.php?content=38459"
license=('GPL')
depends=('libxcursor')
source=(http://www.egregorion.net/works/chameleon/Chameleon-DarkSkyBlue-0.5.tar.bz2) 
md5sums=('3b51b270fe3bfe421f4d91e52437ca36')

package() {
	mkdir -p "${pkgdir}"/usr/share/icons/{Chameleon-DarkSkyBlue-Large,Chameleon-DarkSkyBlue-Regular,Chameleon-DarkSkyBlue-Small}
	cp -R "${srcdir}"/Chameleon-DarkSkyBlue-Large-0.5/{cursors,index.theme} "${pkgdir}"/usr/share/icons/Chameleon-DarkSkyBlue-Large
	cp -R "${srcdir}"/Chameleon-DarkSkyBlue-Regular-0.5/{cursors,index.theme} "${pkgdir}"/usr/share/icons/Chameleon-DarkSkyBlue-Regular
	cp -R "${srcdir}"/Chameleon-DarkSkyBlue-Small-0.5/{cursors,index.theme} "${pkgdir}"/usr/share/icons/Chameleon-DarkSkyBlue-Small
}

