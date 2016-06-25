# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# eclipse-umlet
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds

#Contributor blueray
#Contributor kaptoxic

pkgver=14.2
pkgname=eclipse-umlet
pkgrel=1
pkgdesc="Simple UML drawing tool (Eclipse plugin version)"
arch=('any')
url="http://www.umlet.com"
license=('GPL')
depends=('eclipse')
source=("http://umlet.com/umlet_${pkgver//./_}/com.umlet.plugin-${pkgver}.zip")

sha256sums=('8ccfa18d4ab8bbb1a9a66bdbaef50c34bcd8b7c020269d51ff9b40c4385df44c')

package() {
  cd "$srcdir"
  _dest="${pkgdir}/usr/share/eclipse"
  install -d -m755 $_dest/plugins
  install -D -m644 com.umlet.plugin-${pkgver}.jar $_dest/plugins
}
