# Maintainer: Rhys Perry <rhysperry111@gmail.com>

pkgname=komga
pkgver=0.40.1
pkgrel=1
pkgdesc="Media server for comics/mangas/BDs with API and OPDS support "
arch=('any')
url="https://komga.org"
license=('MIT')
depends=('java-runtime')
source=("https://github.com/gotson/komga/releases/download/v${pkgver}/komga-${pkgver}.jar"
        "komga")
md5sums=('c5690deb34ab4ea86330d4b740502afb'
         'e5713c297be47045511f06664574754f')
package() {
  cd "$pkgdir"
  install -Dm755 "$srcdir"/komga-"$pkgver".jar usr/share/java/komga/komga.jar
  install -Dm755 "$srcdir"/komga usr/bin/komga
}
