# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: scan

# Default color: https://aur.archlinux.org/packages/obsidian-icon-theme/
# Green color: https://aur.archlinux.org/packages/obsidian-icon-theme-green/
# Gray color: https://aur.archlinux.org/packages/obsidian-icon-theme-gray/

pkgname=obsidian-icon-theme-gray
pkgver=20170718
pkgrel=1
pkgdesc="Obsidian Icon Theme - Gray Color"
arch=('any')
url="https://www.gnome-look.org/p/1169579"
license=('GPL')
_git_sha=ce1770f2527843c65db8c4b0c4c3885e6946ab89
source=(
	"https://github.com/madmaxms/iconpack-obsidian/archive/$_git_sha.tar.gz"
)
sha256sums=(
	'22c35d8f232fe899fe9ac8e0bc061264e5585684fb72d0ed9462528105f7ff00'
)

package() {
	install -d ${pkgdir}/usr/share/icons
	cp -r ${srcdir}/iconpack-obsidian-$_git_sha ${pkgdir}/usr/share/icons/Obsidian_gray
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
