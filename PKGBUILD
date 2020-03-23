# Maintainer: Thomas Queiroz <thomasqueirozb@gmail.com>
# Contributor: Sergio Schneider <spsf1964@gmail.com>

pkgname=mojave-gtk-theme
_pkgname=Mojave-gtk-theme
pkgver=2020_02_20
pkgrel=2
pkgdesc='A Mac OSX like theme for GTK 3, GTK 2 and Gnome-Shell which supports GTK 3 and GTK 2 based desktop environments like Gnome, Pantheon, XFCE, Mate, etc.'
arch=('any')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
license=('GPL3')
url='https://github.com/vinceliuice/Mojave-gtk-theme'
source=("${pkgname}-${pkgver//_/-}.tar.gz::https://github.com/vinceliuice/${_pkgname}/archive/${pkgver//_/-}.tar.gz")
sha512sums=('367b72adca4b07696167624ec649a9a134170cf8fb2e9f76c07cee7b15d6b06c7c55946d0cc21b31f14e02dcec19dd990afba4e5d839631e1150bfd699912521')
makedepends=('git')
# options=('!strip')
conflicts=('mojave-gtk-theme-git')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
	install -m755 -d "${pkgdir}/usr/share/themes"
	./install.sh \
		 --dest "${pkgdir}/usr/share/themes" \
		 --icon arch
}
