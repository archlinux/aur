# Maintainer: Minzord

pkgname=redream
pkgver=1.4.0
pkgrel=1
pkgdesc="SEGA Dreamcast emulator"
arch=('x86_64')
url="https://redream.io/"
license=('freeware')
source=("https://redream.io/download/$pkgname.x86_64-linux-v$pkgver.tar.gz"
        "redream.desktop")

md5sums=('bcefb3109033e0992df05655b52dd9d6'
         '8b25ee2d0b1b1797160cf5b6a4c049c6')


package() {
  install -Dm755 redream "$pkgdir"/usr/bin/redream
  install -Dm755 redream.desktop "$pkgdir"/usr/share/applications/redream.desktop
}

