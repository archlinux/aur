# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=supercollider-mkplugins
pkgver=0.2.3
pkgrel=4
pkgdesc="Mads Kjeldgaard's plugins for SuperCollider"
arch=('x86_64')
url="https://github.com/madskjeldgaard/mkplugins"
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
source=("$pkgname-$pkgver.zip::$url/releases/download/v${pkgver}/MKPlugins-Linux.zip")
md5sums=('b9b64102b135fa6dbc4fb06f34b00176')

package() {
 	DESTINATION_="usr/share/SuperCollider/Extensions/"
 	install -dm755 "${pkgdir}/$DESTINATION_/MKPlugins"
 	cp -av ${srcdir}/install/MKPlugins "${pkgdir}/$DESTINATION_"
}
