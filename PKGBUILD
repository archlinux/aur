# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: scan

# Default color: https://aur.archlinux.org/packages/obsidian-icon-theme/
# Green color: https://aur.archlinux.org/packages/obsidian-icon-theme-green/
# Gray color: https://aur.archlinux.org/packages/obsidian-icon-theme-gray/

pkgname=obsidian-icon-theme
pkgver=20170709
pkgrel=1
pkgdesc="Obsidian Icon Theme - Default Color"
arch=('any')
url="https://www.gnome-look.org/p/1169579"
license=('GPL')
_git_sha=b6c1ab47a6f92d9d5f0f3e3fc8931f3d31010176
source=(
	"https://github.com/madmaxms/iconpack-obsidian/archive/$_git_sha.tar.gz"
)
sha256sums=(
	'5a95661d813d8bf09840f9a0460ba00dc27fe1ee66a52e383bfc5a45b8ab1e4e'
)

package() {
	install -d ${pkgdir}/usr/share/icons
	cp -r ${srcdir}/iconpack-obsidian-$_git_sha ${pkgdir}/usr/share/icons/Obsidian
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
