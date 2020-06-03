# Maintainer: Rhys Perry <rhysperry111@gmail.com>

pkgname=komga
pkgver=0.33.0
pkgrel=1
pkgdesc="Media server for comics/mangas/BDs with API and OPDS support "
arch=('any')
url="https://komga.org"
license=('MIT')
depends=('java-runtime')
source=("komga.jar::https://github.com/gotson/komga/releases/download/v${pkgver}/komga-${pkgver}.jar"
        "komga")
md5sums=('763aaf318c237acf68bcb2dcdbb31e6d'
         'e5713c297be47045511f06664574754f')
package() {
  cd "$pkgdir"
  install -Dm755 "$srcdir"/komga.jar usr/share/java/komga/komga.jar
  install -Dm755 "$srcdir"/komga usr/bin/komga
}
