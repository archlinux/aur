# Maintainer: Daniel Müllner <daniel@danifold.net>

pkgname=gtk-theme-mist-redmond-green
_pkgname=Mist-Redmond-Green
pkgver=1.0.2
pkgrel=1
pkgdesc="Simple, no-frills theme with warm gray tones for GTK 2/3."
arch=('any')
url="https://www.gnome-look.org/p/1150209/"
license=('GPL')
depends=('gtk-engines')
source=("$pkgname-$pkgver.zip::https://dl.opendesktop.org/api/files/download/id/1471422191/Mist-Redmond-Green_v1.0.2.zip")
sha256sums=('d3eff3457d277b9b6aa8d95ac99f81f91e38f21ae25c67fa65698965b3063450')

package() {
	install -m755 -d "$pkgdir/usr/share/themes/$_pkgname"
	cp -r $_pkgname/* "$pkgdir/usr/share/themes/$_pkgname"
	chmod -R 644 "$pkgdir"/usr/share/themes/$_pkgname/gtk*/*
}
