pkgname=jkwm-quote
pkgver=1.0.1
pkgrel=1
pkgdesc="jkwm-quote is a simple program that generates a random quote that sounds like said by jkwm in polish"
arch=('x86_64')
url=""
license=('MIT')
source=("jkwm")
sha512sums=('8a975b67e085dce1038abbc4b627e51bc8e48c6f49db378c891c5746fcd424ec8cb33780cd52d8da8f537d123dfae0fd9c90aa61622607f3603651237c8653f5')

package() {
  install -Dm755 jkwm "$pkgdir/usr/bin/jkwm"
}
