pkgname=craftbukkit-plugin-vanishnopacket
pkgver=3.20
pkgrel=1
pkgdesc="The unhackable Vanish plugin"
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/vanish/"
license=("Apache")
makedepends=(dos2unix)
depends=("craftbukkit>=1.7.9")
source=("http://dev.bukkit.org/media/files/911/277/VanishNoPacket.jar")
sha256sums=('e7d9805f16ade6dc0c97e019c7dc17c28f9047b7b06fa4d9ac3f053cc845020f')

package() {
  install -Dm644 VanishNoPacket.jar "$pkgdir/srv/craftbukkit/plugins/VanishNoPacket.jar"
}

