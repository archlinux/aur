# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=supercollider-mkplugins
pkgver=0.2.4
pkgrel=1
pkgdesc="Mads Kjeldgaard's plugins for SuperCollider"
arch=('x86_64')
url="https://github.com/madskjeldgaard/mkplugins"
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
source=("$pkgname-$pkgver.zip::$url/releases/download/v${pkgver}/MKPlugins-Linux.zip")
md5sums=('ab50af744e877b734c93e04d00ba6f21')

package() {
 	DESTINATION_="usr/share/SuperCollider/Extensions/"
 	install -dm755 "${pkgdir}/$DESTINATION_/MKPlugins"
 	cp -av ${srcdir}/install/MKPlugins "${pkgdir}/$DESTINATION_"
}
