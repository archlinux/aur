#Maintainer blueray
pkgver=12.2
pkgname=eclipse-umlet
pkgrel=0
pkgdesc="Simple UML drawing tool (Eclipse plugin version)"
arch=('any')
url="http://www.umlet.com"
license=('GPL')
depends=('eclipse')
source=("http://umlet.com/umlet_${pkgver//./_}/com.umlet.plugin_${pkgver}.0.jar")
noextract=("com.umlet.plugin_${pkgver}.0.jar")
md5sums=('49dd0e793cbeaafc474ff2f944ac345c')

build() {
  cd "$srcdir"
  _dest="${pkgdir}/usr/share/eclipse"
  install -d -m755 $_dest/plugins
  install -D -m644 com.umlet.plugin_${pkgver}.0.jar $_dest/plugins
}
