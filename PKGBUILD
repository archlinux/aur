# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=h2c
pkgver=1.0
pkgrel=1
pkgdesc="Provided a set of HTTP request headers, output the curl command for that set"
arch=('any')
url="https://github.com/curl/h2c"
license=('MIT')
depends=('perl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('78d68c323b194d165a49609819b7b4e937fa0779d96a0fbfb97244f8daef32a27c63f0dde4a7da720bb8f4507648f58b445961d0ef559421fcfc6d647a9f542b')

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" h2c

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" h2c.html README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
