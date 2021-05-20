# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Jack Random <jack ät random.to>
# Contributor: Michael J. Pento <mjpento@verizon.net>
# Contributor: grimi <grimi at poczta dot fm>
pkgname=matcha-gtk-theme
_pkgver=2021-05-20
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A flat design theme for GTK 3, GTK 2 and GNOME Shell"
arch=('any')
url="https://vinceliuice.github.io/theme-matcha.html"
license=('GPL3')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'gtk-engines: GTK2 theme support'
            'qogir-icon-theme: Recommended icon theme'
            'kvantum-theme-matcha: Matching Kvantum theme')
options=('!strip')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/vinceliuice/Matcha-gtk-theme/archive/$_pkgver.tar.gz")
sha256sums=('6c3d3ae50d809174932a3c5e52560e10151f481e3e12f717b712d874fb551a2e')

package() {
	cd "Matcha-gtk-theme-$_pkgver"
	install -d "$pkgdir/usr/share/themes"
	./install.sh -d "$pkgdir/usr/share/themes"
}
