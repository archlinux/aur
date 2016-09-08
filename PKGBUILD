# Maintainer: Daniel Müllner <daniel@danifold.net>

pkgname=gtk-theme-mist-redmond-green
_pkgname=Mist-Redmond-Green
pkgver=1.0.3
pkgrel=1
pkgdesc="Simple, no-frills theme with warm gray tones for GTK 2/3."
arch=('any')
url="https://www.gnome-look.org/p/1150209/"
license=('GPL')
depends=('gtk-engines')
source=("$pkgname-$pkgver.zip::https://dl.opendesktop.org/api/files/download/id/1473367255/Mist-Redmond-Green_v1.0.3.zip")
sha256sums=('f4acadab4263d2037632198bd3a24995f30d57fd726bd02432dd613991fdf545')

package() {
	install -m755 -d "$pkgdir/usr/share/themes/$_pkgname"
	cp -r $_pkgname/* "$pkgdir/usr/share/themes/$_pkgname"
	chmod -R 644 "$pkgdir"/usr/share/themes/$_pkgname/gtk*/*
}
