# Maintainer: Robosky <fangyuhao0612@gmail.com>

pkgname=adapta-gedit-theme
pkgver=3.95.0.1
pkgrel=1
pkgdesc="Material theme for Gedit editor from adapta-project"
arch=('any')
url="https://github.com/adapta-project/adapta-gtk-theme/tree/master/extra/gedit"
license=('GPL2')
depends=('gtksourceview3')
optdepends=('adapta-gtk-theme: The GTK+ theme from adapta-project to uniform the appearance')
source=("https://raw.githubusercontent.com/adapta-project/adapta-gtk-theme/3e20aace294b666343540d9be891f273f6a7b102/extra/gedit/adapta.xml"
	"https://raw.githubusercontent.com/adapta-project/adapta-gtk-theme/3e20aace294b666343540d9be891f273f6a7b102/extra/gedit/adapta-brila.xml")
md5sums=('350cea71deab5ee07081b9d7c064494c'
         'f83d04dbf81ac104cbc4d934c39d26ca')

package() {
	cd "${srcdir}"
	install -d "${pkgdir}"/usr/share/gtksourceview-3.0/styles
	install -m644 *.xml "${pkgdir}"/usr/share/gtksourceview-3.0/styles
}
