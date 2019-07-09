# Maintainer: Minzord

pkgname=redream-dev
pkgver=1.3.1.745.g768a2ce
_pkgver=1.3.1-745-g768a2ce
pkgrel=1
pkgdesc="SEGA Dreamcast emulator"
arch=('x86_64')
url="https://redream.io/"
license=('freeware')
conflicts=(redream)
source=("https://redream.io/download/$pkgname.x86_64-linux-v$_pkgver.tar.gz")
md5sums=('c001cc19e6074716c9a6b89a1ed635c4')


package() {
  install -Dm755 redream "$pkgdir"/usr/bin/redream
}