# Maintainer Thomas Queiroz <thomasqueirozb@gmail.com>
# Contributor: Sergio Schneider <spsf1964@gmail.com>

pkgname=mojave-gtk-theme
_pkgname=Mojave-gtk-theme
pkgver=2020_02_20
pkgrel=1
pkgdesc='A Mac OSX like theme for GTK 3, GTK 2 and Gnome-Shell which supports GTK 3 and GTK 2 based desktop environments like Gnome, Pantheon, XFCE, Mate, etc.'
arch=('any')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
license=('GPL3')
url='https://github.com/vinceliuice/Mojave-gtk-theme'
source=("https://github.com/vinceliuice/${_pkgname}/archive/${pkgver//_/-}.tar.gz")
md5sums=('5fb90ac9bd7155f8f51f5814012691bf')
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
