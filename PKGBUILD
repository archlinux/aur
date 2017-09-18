# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: scan

pkgname=obsidian-2-theme
pkgver=2.0.2
pkgrel=1
pkgdesc="Obsidian 2 Theme GNOME 3.22+"
arch=('any')
url="https://www.gnome-look.org/p/1173113/"
license=('GPL')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=(
	"${pkgname}-${pkgver}.zip::https://github.com/madmaxms/theme-obsidian-2/releases/download/v${pkgver}/obsidian-2-theme.zip"
)
sha256sums=(
	'35080c427e1c6e32bf84569b691323f3931ec81858e989fb1bc71e36ee8ee854'
)

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r ${srcdir}/Obsidian-2* ${pkgdir}/usr/share/themes/
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
