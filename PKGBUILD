# Maintainer: Antonio Tauro <eye at eyenx.ch>
pkgname=whalebrew
pkgver=0.2.4
pkgrel=1
pkgdesc="Homebrew, but with Docker images"
arch=('x86_64')
url="https://github.com/bfirsh/whalebrew"
license=('Apache License 2.0')
provides=('whalebrew')
depends=('docker')
conflicts=('whalebrew')
source=("https://github.com/bfirsh/whalebrew/releases/download/${pkgver}/whalebrew-Linux-x86_64")
md5sums=('ebf17a7b6cd6c94b8d92abe6e655f45d')
sha256sums=('057d96ac518daa0cfaf161a2ef677153590696be7708d1dbf8c91cc1a810527c')

package() {
  install -D -m755 "$srcdir"/whalebrew-Linux-x86_64 "$pkgdir/usr/bin/whalebrew"
}
