# Maintainer: Daniel Müllner <daniel@danifold.net>

pkgname=gtk-theme-mist-redmond-green
_pkgname=Mist-Redmond-Green
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple, no-frills theme with warm gray tones for GTK 2/3."
arch=('any')
url="https://www.gnome-look.org/p/1150209/"
license=('GPL')
depends=('gtk-engines')
source=("$pkgname-$pkgver.zip::https://dl.opendesktop.org/api/files/download/id/1471417637/Mist-Redmond-Green_v1.0.1.zip")
sha256sums=('10f4aeeb84e37b8fd5e4dd9e0892c66628e8cd2386b8fca3d7415a148cbee8e8')

package() {
	install -m755 -d "$pkgdir/usr/share/themes/$_pkgname"
	cp -r $_pkgname/* "$pkgdir/usr/share/themes/$_pkgname"
	chmod -R 644 "$pkgdir"/usr/share/themes/$_pkgname/gtk*/*
}
