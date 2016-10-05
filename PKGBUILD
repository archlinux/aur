# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=giter8
pkgver=0.7.1
pkgrel=1
pkgdesc="a command line tool to apply templates defined on github"
arch=(any)
url="https://github.com/foundweekends/giter8"
license=('LGPL')
depends=('sbt')
options=(!emptydirs)
source=("giter8.properties_$pkgver::https://github.com/foundweekends/giter8/raw/v${pkgver}/src/main/conscript/g8/launchconfig"
	"g8")
md5sums=('3146e63e51bb7ebe98949216bc74b4f3'
         'de3e643189a99a3267329ff6c559eae1')

package() {
  cd "$srcdir"
  install -D -m 664 giter8.properties_$pkgver "$pkgdir"/usr/share/scala/apps/giter8.properties
  install -D -m 775 g8 "$pkgdir"/usr/bin/g8
}

