# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=si-bin
pkgver=20230816.220323.0
_releasesha=7c15b746c
pkgrel=1
pkgdesc="A collaborative power tool designed to remove the papercuts from DevOps work"
arch=('x86_64')
url="https://systeminit.com/"
depends=('glibc' 'gcc-libs')
license=('Apache')
source=("https://github.com/systeminit/si/releases/download/bin/si/binary/${pkgver}-sha.${_releasesha}/si-x86_64-linux.tar.gz")
sha256sums=('08657330897c5272d2bb3afcd05c1433e612621bfb0473738b6ee23590d41a14')

package() {
  install -Dm 755 "$srcdir/si" -t "$pkgdir/usr/bin"
}
