pkgname=ttf-go
pkgver=2.010
pkgrel=2
_imagever=0.1.0
pkgdesc='The font for the experimental Go user interface toolkit'
url=https://go.dev/blog/go-fonts
arch=(any)
license=(BSD-3-Clause)
options=(!debug)
source=(v$_imagever.tar.gz::https://github.com/golang/image/archive/refs/tags/v$_imagever.tar.gz)
b2sums=(2ed2cd0b0ee50a8bed1b489813755cfca98ce6374ad5782ca5518c8b36cc85931de631b4db5e7ef51d49226a8221fcedd2b58204c724c67c4bc4fcfc797d57fd)

package() {
	install -Dm 644 image-$_imagever/font/gofont/ttfs/*.ttf -t $pkgdir/usr/share/fonts/go
	install -Dm 644 image-$_imagever/font/gofont/ttfs/README $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
