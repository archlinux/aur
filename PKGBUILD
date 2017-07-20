# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: scan

# Default color: https://aur.archlinux.org/packages/obsidian-icon-theme/
# Green color: https://aur.archlinux.org/packages/obsidian-icon-theme-green/
# Gray color: https://aur.archlinux.org/packages/obsidian-icon-theme-gray/

pkgname=obsidian-icon-theme
pkgver=20170718
pkgrel=1
pkgdesc="Obsidian Icon Theme - Default Color"
arch=('any')
url="https://www.gnome-look.org/p/1169579"
license=('GPL')
_git_sha=7dd3e1c6427baf8968d4408662908817609b1f2e
source=(
	"https://github.com/madmaxms/iconpack-obsidian/archive/$_git_sha.tar.gz"
)
sha256sums=(
	'1f774f65fb158eeb69932f7149ac590773fe80df61f1b8f593cc5ada3b66cdb6'
)

package() {
	install -d ${pkgdir}/usr/share/icons
	cp -r ${srcdir}/iconpack-obsidian-$_git_sha ${pkgdir}/usr/share/icons/Obsidian
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
