# Maintainer: Rhys Perry <rhysperry111@gmail.com>

pkgname=komga
pkgver=0.35.0
pkgrel=1
pkgdesc="Media server for comics/mangas/BDs with API and OPDS support "
arch=('any')
url="https://komga.org"
license=('MIT')
depends=('java-runtime')
source=("komga.jar::https://github.com/gotson/komga/releases/download/v${pkgver}/komga-${pkgver}.jar"
        "komga")
md5sums=('889ff833ab50f765f25d2d112fe2a8ff'
         'e5713c297be47045511f06664574754f')
package() {
  cd "$pkgdir"
  install -Dm755 "$srcdir"/komga.jar usr/share/java/komga/komga.jar
  install -Dm755 "$srcdir"/komga usr/bin/komga
}
