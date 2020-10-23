# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Jack Random <jack ät random.to>
# Contributor: Michael J. Pento <mjpento@verizon.net>
# Contributor: grimi <grimi at poczta dot fm>
pkgname=matcha-gtk-theme
_pkgver=2020-10-23
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
sha256sums=('6c50513ea2f235e5693aaf3d7168451ab2d8ff3a0ca7352b17577ebf8d76f8f0')

package() {
	cd "Matcha-gtk-theme-$_pkgver"
	install -d "$pkgdir/usr/share/themes"
	./install.sh -d "$pkgdir/usr/share/themes"
}
