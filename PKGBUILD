# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds
# Contributor: scan

pkgname=obsidian-2-theme
pkgver=2.23
pkgrel=1
pkgdesc="Obsidian 2 Theme - Gnome theme, based upon Adwaita-Maia dark skin"
arch=('any')
url="https://github.com/madmaxms/theme-obsidian-2/"
license=('GPL')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/madmaxms/theme-obsidian-2/releases/download/v${pkgver}/obsidian-2-theme.tar.xz"
)
sha256sums=('c89a0c4b95eb1e532cb3eadd27ec4b271d05f47b3509cf8c164fb1ca145769fd')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r ${srcdir}/Obsidian-2* ${pkgdir}/usr/share/themes/
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
