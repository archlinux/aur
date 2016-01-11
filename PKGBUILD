#Contributor blueray
#Maintainer kaptoxic

pkgver=13.3
pkgname=eclipse-umlet
pkgrel=1
pkgdesc="Simple UML drawing tool (Eclipse plugin version)"
arch=('any')
url="http://www.umlet.com"
license=('GPL')
depends=('eclipse')
source=("http://umlet.com/umlet_${pkgver//./_}/com.umlet.plugin_${pkgver}.0.jar")
noextract=("com.umlet.plugin_${pkgver}.0.jar")
md5sums=('0142e45a46ef6634adf07790bf94f540')

package() {
  cd "$srcdir"
  _dest="${pkgdir}/usr/share/eclipse"
  install -d -m755 $_dest/plugins
  install -D -m644 com.umlet.plugin_${pkgver}.0.jar $_dest/plugins
}
