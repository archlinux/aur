# Maintainer: Llathasa Veleth <llathasa at outlook dot com>
pkgname=rralle-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Random quote fetching console utility'
arch=('x86_64')
url="https://github.com/q60/rralle"
license=('MIT')
depends=('erlang')
provides=('rralle')
source=("$pkgname-$pkgver::$url/releases/download/$pkgver/rralle")
sha256sums=('0991f450d81317ad2fb382bab5e7b7d685bae5cbf76f9d75a345f4b0ab9faf40')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/rralle"
}
