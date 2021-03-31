# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=supercollider-mkplugins
pkgver=0.2.0
pkgrel=1
pkgdesc="Mads Kjeldgaard's plugins for SuperCollider"
arch=('x86_64')
url="https://github.com/madskjeldgaard/mkplugins"

license=('GPL')
groups=('pro-audio')
depends=('supercollider')
source=("$url/releases/download/v${pkgver}/MKPlugins-Linux.zip")
md5sums=('a4989cbbbbe86c56955e8369878a1464')

package() {
	DESTINATION_="usr/share/SuperCollider/Extensions/"
	install -dm755 "${pkgdir}/$DESTINATION_/MKPlugins"
	cp -av ${srcdir}/install/MKPlugins "${pkgdir}/$DESTINATION_"
}
