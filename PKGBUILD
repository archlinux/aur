# Maintainer: Minzord

pkgname=redream
pkgver=1.4.0
pkgrel=2
pkgdesc="SEGA Dreamcast emulator"
arch=('x86_64')
url="https://redream.io/"
license=('freeware')
source=("https://redream.io/download/$pkgname.x86_64-linux-v$pkgver.tar.gz"
        "redream.desktop")

md5sums=('bcefb3109033e0992df05655b52dd9d6'
         '276e283473ac145ebeb5505607ac0f13')


package() {
  install -Dm755 redream "$pkgdir"/opt/redream/redream
  chmod -R 777 "$pkgdir"/opt/redream
  install -Dm755 redream.desktop "$pkgdir"/usr/share/applications/redream.desktop
}

