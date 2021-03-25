# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=supercollider-mkplugins
pkgver=0.1.8E
pkgrel=1
pkgdesc="Mads Kjeldgaard's plugins for SuperCollider"
arch=('x86_64')
url="https://github.com/madskjeldgaard/mkplugins"

license=('GPL')
groups=('pro-audio')
depends=('supercollider')
source=("$url/releases/download/v${pkgver}/MKPlugins-Linux.zip")
md5sums=('d800dbc6f6f19a582290dc866a3bc29e')

package() {
	DESTINATION_="usr/share/SuperCollider/Extensions/"
	install -dm755 "${pkgdir}/$DESTINATION_/MKPlugins"
	cp -av ${srcdir}/install/MKPlugins "${pkgdir}/$DESTINATION_"
}
