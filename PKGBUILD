# Maintainer: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=kmcaster
pkgver=1.0.3
pkgrel=1
pkgdesc="On-screen display (OSD) for keyboard and mouse events"
arch=('any')
url="https://github.com/DaveJarvis/kmcaster"
license=('GPL')
depends=('java-runtime')
source=("${pkgname}_${pkgver}.jar"::"https://github.com/DaveJarvis/kmcaster/releases/download/${pkgver}/kmcaster.jar"
        "kmcaster.sh")
noextract=("${pkgname}_$pkgver.jar")

package() {
  install -Dm644 ${pkgname}_$pkgver.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 kmcaster.sh "$pkgdir/usr/bin/kmcaster"
}
md5sums=('feb59f5e21a0085f3fcd1e30e09c3cd1'
         '1a0f9d526026123bf593b3be139611e8')
