# Maintainer: Racovik <racovikpvpbr@gmail.com>
pkgname=tiktok-ttsk
pkgver=1.0.0
pkgrel=1
pkgdesc="Python tool to automatically maintain TikTok conversation streaks."
arch=('x86_64')
url="https://github.com/Kameil/tiktok-ttsk"
license=('GPL-3.0-or-later')
depends=('python')
options=('!strip')
source=("$pkgname.bin::$url/releases/download/$pkgver/$pkgname.bin")
sha256sums=('3dcac68938055f630a3c41ec49c3c010c311f24c309a35c2f9d1a118e5f2c96a')

package() {
  install -Dm755 "$srcdir/$pkgname.bin" "$pkgdir/usr/bin/$pkgname"
}
