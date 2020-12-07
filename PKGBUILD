# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds
# Contributor: scan

pkgname=obsidian-2-theme
pkgver=2.17
pkgrel=1
pkgdesc="Obsidian 2 Theme GNOME 3.22+"
arch=('any')
url="https://github.com/madmaxms/theme-obsidian-2/"
license=('GPL')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/madmaxms/theme-obsidian-2/releases/download/v${pkgver}/obsidian-2-theme.tar.xz"
)
sha256sums=('c42288541a0e574e744c5253fb4597073ced22618c6c5a0284125f8f3b19cebd')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r ${srcdir}/Obsidian-2* ${pkgdir}/usr/share/themes/
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
