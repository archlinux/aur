# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: scan

pkgname=obsidian-2-theme
pkgver=20170619
pkgrel=1
pkgdesc="Obsidian 2 Theme GNOME 3.22+"
arch=('any')
url="https://www.gnome-look.org/p/1173113/"
license=('GPL')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
_git_sha=bc5ba29ab28ec1ea76506b241a119c1f811ac73f
_git_green_sha=2fc1d21341d689b111590f5844aabc0285b30b18
source=(
	"https://github.com/madmaxms/theme-obsidian-2/archive/$_git_sha.tar.gz"
	"https://github.com/madmaxms/theme-obsidian-2/archive/$_git_green_sha.tar.gz"
)
sha256sums=(
	'da575b2a2e983babe266258731252eff7fc48e5411bdc8ce20094c311b906797'
	'2b8172b6b891cb77771f0653f08daa96cce8348b0e0e119745e35feca0d0c61f'
)

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r ${srcdir}/theme-obsidian-2-$_git_sha/Obsidian-2 ${pkgdir}/usr/share/themes/Obsidian-2
	cp -r ${srcdir}/theme-obsidian-2-$_git_green_sha/Obsidian-2-green ${pkgdir}/usr/share/themes/Obsidian-2-green
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
