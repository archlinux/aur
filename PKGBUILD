# Maintainer: Husam Bilal <me@husam.dev>

pkgname=clipman
pkgver=0.7.1
pkgrel=1
pkgdesc="A simple clipboard manager for Wayland"
url="https://github.com/yory8/clipman"
makedepends=("go-pie")
provides=("clipman")
license=("GPL3")
arch=("x86_64" "i686")
md5sums=("93cdc82aeca4a288b75bb2fa52aa8e41")
source=("https://github.com/yory8/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd $pkgname-$pkgver
  go build .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
