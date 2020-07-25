# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor: Bjoern Franke <bjo at nord-west.org>
# Contributor: flan_suse
pkgname=xfce-theme-greybird
pkgver=3.22.12
pkgrel=1
pkgdesc="Desktop Suite for Xfce"
arch=('any')
url="https://shimmerproject.org"
license=('CC BY-SA-3.0' 'GPL')
depends=('gtk-engine-murrine' 'gtk3')
makedepends=('librsvg' 'meson' 'sassc')
optdepends=('elementary-xfce-icons: matching icon set; use the dark icon theme'
            'lightdm-gtk-greeter: required for the LightDM GTK theme'
            'shimmer-wallpapers: contains the Greybird wallpaper, among others'
            'lib32-gtk-engine-murrine: required for multilib')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/shimmerproject/Greybird/archive/v$pkgver.tar.gz")
sha256sums=('410804cd5daca33cbc5c7c4a179f3a334ced87f408e515fc5d9c083a04bec4bc')

build() {
	arch-meson "Greybird-$pkgver" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}

pkgname=xfce-theme-greybird
pkgver=3.22.12
pkgrel=1
pkgdesc="Desktop Suite for Xfce"
arch=('any')
url="https://shimmerproject.org"
license=('CC BY-SA-3.0' 'GPL')
depends=('gtk-engine-murrine' 'gtk3')
makedepends=('librsvg' 'meson' 'sassc')
optdepends=('elementary-xfce-icons: matching icon set; use the dark icon theme'
            'lightdm-gtk-greeter: required for the LightDM GTK theme'
            'shimmer-wallpapers: contains the Greybird wallpaper, among others'
            'lib32-gtk-engine-murrine: required for multilib')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/shimmerproject/Greybird/archive/v$pkgver.tar.gz")
sha256sums=('410804cd5daca33cbc5c7c4a179f3a334ced87f408e515fc5d9c083a04bec4bc')

build() {
	arch-meson "Greybird-$pkgver" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
