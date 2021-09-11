# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=supercollider-portedplugins
pkgver=0.3.0d
pkgrel=1
pkgdesc="SuperCollider plugins ported and remixed from other projects"
arch=('x86_64')
url="https://github.com/madskjeldgaard/portedplugins"
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
conflicts=("supercollider-mkplugins" "supercollider-mkplugins-git" "supercollider-portedplugins-git")
source=("$pkgname-$pkgver.zip::$url/releases/download/v${pkgver}/PortedPlugins-Linux.zip")
md5sums=('5b8c1fa90e8d05b13150f28f89828681')

package() {
 	DESTINATION_="usr/share/SuperCollider/Extensions/"
 	install -dm755 "${pkgdir}/$DESTINATION_/PortedPlugins"
 	cp -av ${srcdir}/install/PortedPlugins "${pkgdir}/$DESTINATION_"
}
