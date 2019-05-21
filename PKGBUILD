# Maintainer: Rémi BERTHO <remi.bertho@dalan.fr>
# Contributor: Rémi BERTHO <remi.bertho@dalan.fr>
pkgname=simple-panorama-viewer
pkgver=1.0.0
pkgrel=2
pkgdesc="Simple web based panorama viewer"
arch=(any)
url="https://www.dalan.fr"
license=('MIT')
depends=('python3' 'python-pyqt5' 'python-pyqtwebengine')
install="INSTALL"
source=(https://git.berthor.eu/dalan/SimplePanoramaViewer/archive/1.0.tar.gz)
sha512sums=('fc4e80d994fb1efa067118fc979993ff924072ecf2e79d87d9afb3c98f79fd9330e252784446c861262b041425840bdbc5c8d1264bc4dad1edf1ac386575c759')

package()
{
	cd "$srcdir/simplepanoramaviewer"
 	./utility.sh -i "${pkgdir}" "/usr"
}
