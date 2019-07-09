# Maintainer: Minzord

pkgname=redream-dev
pkgver=1.3.1.748.g163a591
_pkgver=1.3.1-748-g163a591
pkgrel=1
pkgdesc="SEGA Dreamcast emulator"
arch=('x86_64')
url="https://redream.io/"
license=('freeware')
conflicts=(redream)
source=("https://redream.io/download/$pkgname.x86_64-linux-v$_pkgver.tar.gz")
md5sums=('318ac942d3be04a73b16482158a74beb')


package() {
  install -Dm755 redream "$pkgdir"/usr/bin/redream
}
