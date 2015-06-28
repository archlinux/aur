# Maintainer: sumt <sumt at sci dot fi>
# Contributor: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Pablo Lezaeta <prflr88 (arroba) gmail (dot) com>

pkgname=gtk-theme-mist-redmond
_pkgname=Mist-Redmond
pkgver=1.2
pkgrel=2
pkgdesc="Mist like theme for gtk2/3 with colors from Redmond theme."
arch=('any')
url="http://gnome-look.org/content/show.php/Mist-Redmond?content=155580"
license=('GPL')
depends=('gtk-engines')
source=("$pkgname-$pkgver.zip::http://gnome-look.org/CONTENT/content-files/155580-gtk3.8-theme_Mist-Redmond.zip")
sha256sums=('c1d91fcdc52a4ff52fff3b1530ddbde37572fbb703fcc35dbade58f963e03f6e')

package() {
	install -m755 -d "$pkgdir/usr/share/themes/$_pkgname"
	cp -r $_pkgname/* "$pkgdir/usr/share/themes/$_pkgname"
	chmod -R 644 "$pkgdir"/usr/share/themes/$_pkgname/gtk*/*
}
