# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: scan

# Default color: https://aur.archlinux.org/packages/obsidian-icon-theme/
# Green color: https://aur.archlinux.org/packages/obsidian-icon-theme-green/
# Gray color: https://aur.archlinux.org/packages/obsidian-icon-theme-gray/

pkgname=obsidian-icon-theme-gray
pkgver=20170626
pkgrel=1
pkgdesc="Obsidian Icon Theme - Gray Color"
arch=('any')
url="https://www.gnome-look.org/p/1169579"
license=('GPL')
_git_sha=3c1b132b8a0c7de393a67280b7d2b733dfb2e00c
source=(
	"https://github.com/madmaxms/iconpack-obsidian/archive/$_git_sha.tar.gz"
)
sha256sums=(
	'133d578a58c2ed9436b855efd0ee0a3e5ecf3e5b902e7cc4ccfb22962041baff'
)

package() {
	install -d ${pkgdir}/usr/share/icons
	cp -r ${srcdir}/iconpack-obsidian-$_git_sha ${pkgdir}/usr/share/icons/Obsidian_gray
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
