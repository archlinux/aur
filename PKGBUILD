# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

pkgname=ptyxis-palette-darcula2
pkgver=1.0.0
pkgrel=1
pkgdesc="Ptyxis palette based on GtkSourceView Darcula2 theme"
arch=('any')
url="https://github.com/egormanga/${pkgname}"
optdepends=('ptyxis')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8e16addc52fcd44c4b7cb17c3a9795c86313ebf5744a995d49ab064895573750')

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm644 'darcula2.palette' -t "${pkgdir}/usr/share/org.gnome.Ptyxis/palettes"
}
