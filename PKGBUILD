# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=giter8
pkgver=0.6.8
pkgrel=1
pkgdesc="a command line tool to apply templates defined on github"
arch=(any)
url="https://github.com/n8han/giter8"
license=('LGPL')
depends=('sbt')
options=(!emptydirs)
source=("giter8.properties_$pkgver::https://raw.githubusercontent.com/n8han/giter8/$pkgver/src/main/conscript/g8/launchconfig"
	"g8")
md5sums=('28ac12267f81ccf896500584969416cb'
         'de3e643189a99a3267329ff6c559eae1')

package() {
  cd "$srcdir"
  install -D -m 664 giter8.properties_$pkgver "$pkgdir"/usr/share/scala/apps/giter8.properties
  install -D -m 775 g8 "$pkgdir"/usr/bin/g8
}

