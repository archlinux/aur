# Maintainer: Daniel Müllner <daniel@danifold.net>

pkgname=gtk-theme-mist-redmond-green
_pkgname=Mist-Redmond-Green
pkgver=1.0.8
pkgrel=1
pkgdesc="Simple, no-frills theme with warm gray tones for GTK 2/3."
arch=('any')
url="https://github.com/dmuellner/mist-redmond-green/"
license=('GPL3')
depends=('gtk-engines')
source=("$pkgname-$pkgver.zip::https://github.com/dmuellner/mist-redmond-green/archive/v$pkgver.zip")
sha256sums=('13e7c876b745321ac77a739f6c93ea58d9064f623fcc51e58d2d85f45f663c92')

package() {
	install -m755 -d "$pkgdir/usr/share/themes/$_pkgname"
	rm -r mist-redmond-green-$pkgver/screenshots
	cp -r mist-redmond-green-$pkgver/* "$pkgdir/usr/share/themes/$_pkgname"
	chmod -R 644 "$pkgdir"/usr/share/themes/$_pkgname/gtk*/*
}
