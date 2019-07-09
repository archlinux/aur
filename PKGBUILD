# Maintainer: Minzord

pkgname=redream
pkgver=1.3.1
pkgrel=1
pkgdesc="SEGA Dreamcast emulator"
arch=('x86_64')
url="https://redream.io/"
license=('freeware')
source=("https://redream.io/download/$pkgname.x86_64-linux-v$pkgver.tar.gz")

md5sums=('699c086a387900b27d553817c38cf1a5')


package() {
  install -Dm755 redream "$pkgdir"/usr/bin/redream
}

