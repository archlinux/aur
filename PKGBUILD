# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Jack Random <jack ät random.to>
# Contributor: Michael J. Pento <mjpento@verizon.net>
# Contributor: grimi <grimi at poczta dot fm>
pkgname=matcha-gtk-theme
_pkgver=2020-09-28
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A flat design theme for GTK 3, GTK 2 and GNOME Shell"
arch=('any')
url="https://vinceliuice.github.io/theme-matcha.html"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
optdepends=('qogir-icon-theme: Recommended icon theme'
            'kvantum-theme-matcha: Matching Kvantum theme')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/vinceliuice/Matcha-gtk-theme/archive/$_pkgver.tar.gz")
options=('!strip')
sha256sums=('8fbb0dd9c439243ead34d3c417d00d396497da19e6b2e05cf2295fbd67db3c28')

package() {
	cd "Matcha-gtk-theme-$_pkgver"
	install -d "$pkgdir/usr/share/themes"
	./install.sh -d "$pkgdir/usr/share/themes"
}
