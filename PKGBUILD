# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=latestpaper
pkgname="${_pkgname}-bin"
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple Go program that downloads the latest papermc"
arch=('i686' 'x86_64')
url="https://github.com/ShayBox/$pkgname"
license=('MIT')
source+=($pkgname::$url/releases/download/$pkgver/LatestPaper-linux)
sha256sums=('390af14ac9e4182aa588b194fbb883bf690c0a4506ce9ea9e52abf53f77d58ab')

package() {
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
