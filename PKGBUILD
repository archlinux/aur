# Maintainer: Daniel Müllner <daniel@danifold.net>

pkgname=gtk-theme-mist-redmond-green
_pkgname=Mist-Redmond-Green
pkgver=1.0.4
pkgrel=1
pkgdesc="Simple, no-frills theme with warm gray tones for GTK 2/3."
arch=('any')
url="https://www.gnome-look.org/p/1150209/"
license=('GPL')
depends=('gtk-engines')
source=("$pkgname-$pkgver.zip::https://dl.opendesktop.org/api/files/download/id/1499007735/Mist-Redmond-Green_v1.0.4.zip")
sha256sums=('5007a35e88b148d945d3b27b3624178f72375bd44923b88184c70290bc53622e')

package() {
	install -m755 -d "$pkgdir/usr/share/themes/$_pkgname"
	cp -r $_pkgname/* "$pkgdir/usr/share/themes/$_pkgname"
	chmod -R 644 "$pkgdir"/usr/share/themes/$_pkgname/gtk*/*
}
