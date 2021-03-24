# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=supercollider-mkplugins
pkgver=0.1.7D
pkgrel=1
pkgdesc="Mads Kjeldgaard's plugins for SuperCollider"
arch=('x86_64')
url="https://github.com/madskjeldgaard/mkplugins"

license=('GPL')
groups=('pro-audio')
depends=('supercollider')
source=("$url/releases/download/v.${pkgver}/MKPlugins-Linux.zip")
md5sums=('1a0d9d4d35ed6a48f3716917606775ef')

package() {
	DESTINATION_="usr/share/SuperCollider/Extensions/"
	install -dm755 "${pkgdir}/$DESTINATION_/MKPlugins"
	cp -av ${srcdir}/install/MKPlugins "${pkgdir}/$DESTINATION_"
}
