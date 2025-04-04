# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='gedit-gnuplot'
pkgver='1.0.0'
pkgrel=1
pkgdesc='gnuplot color highlighting for gedit'
arch=('any')
url='https://wiki.gnome.org/Projects/GtkSourceView/LanguageDefinitions'
license=('GPL')
depends=('gedit')
source=('gnuplot.lang')
sha256sums=('ffce11a5edbe0b0360090c5f039ff7e12d67844c7ae4f8936da357f19aa1cbc0')

package() {

	cd "${srcdir}"

	install -dm755 "${pkgdir}/usr/share/libgedit-gtksourceview-300"

	install -Dm644 "${srcdir}/gnuplot.lang" \
		"${pkgdir}/usr/share/libgedit-gtksourceview-300/gnuplot.lang"
}

