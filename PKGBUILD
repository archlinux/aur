# Maintainer: Mauricio Morales <mocomauricio@gmail.com>

pkgname=xmms-skins
pkgver=1.2.11
pkgrel=1
pkgdesc="skins for XMMS"
arch=('any')
url="https://www.xmms.org"
license=('GPL')
depends=('xmms')
source=(https://manualinux.eu/archivos/xmms-pieles.tar.bz2)
noextract=('xmms-pieles.tar.bz2')
md5sums=('d214397c4a3fd2b2cf8e9781ab0392bc')

package() {
	install -dm755 "$pkgdir"/usr/share/xmms/Skins
	tar jxvf xmms-pieles.tar.bz2 --strip-components=1 -C "$pkgdir"/usr/share/xmms/Skins
        

}
