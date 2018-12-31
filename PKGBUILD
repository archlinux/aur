# Maintainer: Robosky <fangyuhao0612@gmail.com>

pkgname=adapta-gedit-theme
pkgver=3.95.0.11
pkgrel=2
pkgdesc="Material theme for Gedit editor from adapta-project"
arch=('any')
url="https://github.com/adapta-project/adapta-gtk-theme/tree/master/extra/gedit"
license=('GPL2')
depends=('gtksourceview3')
optdepends=('adapta-gtk-theme: The GTK+ theme from adapta-project to uniform the appearance')
source=("https://raw.githubusercontent.com/adapta-project/adapta-gtk-theme/3.95.0.11/extra/gedit/adapta.xml")
md5sums=('7364dc10aa7f9c90d2fa8b14ca9585d2')

package() {
	cd "${srcdir}"
	install -d "${pkgdir}"/usr/share/gtksourceview-3.0/styles
	install -m644 *.xml "${pkgdir}"/usr/share/gtksourceview-3.0/styles
}
