# Maintainer: Minzord

pkgname=redream-dev
pkgver=1.3.1.747.g433472e
_pkgver=1.3.1-747-g433472e
pkgrel=1
pkgdesc="SEGA Dreamcast emulator"
arch=('x86_64')
url="https://redream.io/"
license=('freeware')
conflicts=(redream)
source=("https://redream.io/download/$pkgname.x86_64-linux-v$_pkgver.tar.gz")
md5sums=('e4d87c7a304e8b11bb2112699ec4dab4')


package() {
  install -Dm755 redream "$pkgdir"/usr/bin/redream
}