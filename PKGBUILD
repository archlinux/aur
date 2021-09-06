# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=latestpaper
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple Go program that downloads the latest papermc"
arch=('i686' 'x86_64')
url="https://github.com/ShayBox/$pkgname"
license=('MIT')
source+=($pkgname::$url/releases/download/$pkgver/LatestPaper-linux)
sha256sums=('8cdaac367c042eefc28724b6f101d47f23ce49656d578d4ee7da4f20bfde5956')

package() {
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
