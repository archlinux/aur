# Maintainer: Linus Dierheimer <Linus@Dierheimer.de>
# Contributor: Mikołaj Chwalisz <m.chwalisz@gmail.com>

pkgname=plantuml-pdf
pkgver=1.9999.0 # Keep compatible with previous package versioning
pkgrel=1
pkgdesc="Extends plantuml package to enable PDF support"
arch=(any)
url="http://plantuml.com/"
license=('GPL')
depends=("plantuml")
source=("http://beta.plantuml.net/batikAndFop.zip")
sha256sums=("c1f328a9aacfd954c6cd90650cefd924baea358d6e27520de7ccf9b30a681877")

package() {
  mkdir -p "$pkgdir/usr/share/java/plantuml/"
  cp -r "$srcdir"/*.jar "$pkgdir/usr/share/java/plantuml/"
}
