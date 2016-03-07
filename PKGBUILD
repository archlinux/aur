# Maintainde by SplitFire (split7fire at yandex.ru)

pkgname=xcursor-chameleon-anthracite
pkgver=0.5
pkgrel=1
pkgdesc="Chameleon X Cursor Theme (anthracite flavour)"
arch=('any')
url="http://www.kde-look.org/content/show.php?content=38459"
license=('GPL')
depends=('libxcursor')
source=(http://www.egregorion.net/works/chameleon/Chameleon-Anthracite-0.5.tar.bz2) 
md5sums=('f8cc2fe5174e706c64bf05a8425d2991')

package() {
	mkdir -p "${pkgdir}"/usr/share/icons/{Chameleon-Anthracite-Large,Chameleon-Anthracite-Regular,Chameleon-Anthracite-Small}
	cp -R "${srcdir}"/Chameleon-Anthracite-Large-0.5/{cursors,index.theme} "${pkgdir}"/usr/share/icons/Chameleon-Anthracite-Large
	cp -R "${srcdir}"/Chameleon-Anthracite-Regular-0.5/{cursors,index.theme} "${pkgdir}"/usr/share/icons/Chameleon-Anthracite-Regular
	cp -R "${srcdir}"/Chameleon-Anthracite-Small-0.5/{cursors,index.theme} "${pkgdir}"/usr/share/icons/Chameleon-Anthracite-Small
}
