# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=supercollider-f0plugins
pkgver=4.0.3
pkgrel=1
pkgdesc="redFrik's SuperCollider plugins"
arch=('x86_64')
url="https://github.com/redFrik/f0plugins"
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
source=("$pkgname-$pkgver.zip::$url/releases/download/v${pkgver}/f0plugins-Linux.zip")
md5sums=('4479887fc3575128c0ced556f1effcd6')

package() {
 	DESTINATION_="usr/share/SuperCollider/Extensions/"
 	install -dm755 "${pkgdir}/$DESTINATION_/f0plugins"
 	cp -av ${srcdir}/install/f0plugins "${pkgdir}/$DESTINATION_"
}
