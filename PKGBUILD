pkgname=netbeans-jtattoo-jar
pkgver=1.6.13
pkgrel=1
pkgdesc="Additional themes for Netbeans"
arch=('any')
license=('GPL' 'LGPL' 'Apache')
depends=('netbeans' 'java-runtime>=6')
source=("http://www.jtattoo.net/downloads/JTattoo-${pkgver}.jar")
md5sums=('acebee0f33787ae843e018a6a96adf4f')
install=$pkgname.install
url="http://www.jtattoo.net"

package() {
        mkdir -p "$pkgdir/usr/lib/netbeans/platform/lib/"
        install "$srcdir/JTattoo-$pkgver.jar" "$pkgdir/usr/lib/netbeans/platform/lib/"
}
