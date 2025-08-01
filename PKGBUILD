pkgname=ttf-go
pkgver=2.010
pkgrel=1
_imagever=0.29.0
pkgdesc='The font for the experimental Go user interface toolkit'
url=https://go.dev/blog/go-fonts
arch=(any)
license=(BSD-3-Clause)
source=(v$_imagever.tar.gz::https://github.com/golang/image/archive/refs/tags/v$_imagever.tar.gz)
b2sums=(6a4265e9f59ea522bc2cbcf457e6b90fbe2b11ca8814b0cd712553f49e979ecaa9c6a9d22410fc218b2a7c6cbb1101b2efe9c9f504e2168aedbd7a45ed8d40e9)

package() {
	install -Dm 644 image-$_imagever/font/gofont/ttfs/*.ttf -t $pkgdir/usr/share/fonts/go
	install -Dm 644 image-$_imagever/font/gofont/ttfs/README $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
