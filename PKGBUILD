# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: scan

pkgname=obsidian-icon-theme
pkgver=20170626
pkgrel=1
pkgdesc="Obsidian Icon Theme"
arch=('any')
url="https://www.gnome-look.org/p/1169579"
license=('GPL')
_git_sha=db8e75e61e693e095b24bfec862a9634251b99b6
source=("https://github.com/madmaxms/iconpack-obsidian/archive/$_git_sha.tar.gz")
sha256sums=('2d3203a7d5abe462ce544ff124b8c0de31d230ebd83564717f6423ba52e57ea5')

package() {
	install -d ${pkgdir}/usr/share/icons
	cp -r ${srcdir}/iconpack-obsidian-$_git_sha/Obsidian ${pkgdir}/usr/share/icons/Obsidian
	cp -r ${srcdir}/iconpack-obsidian-$_git_sha/Obsidian_gray ${pkgdir}/usr/share/icons/Obsidian_gray
	cp -r ${srcdir}/iconpack-obsidian-$_git_sha/Obsidian_green ${pkgdir}/usr/share/icons/Obsidian_green
	cp -r ${srcdir}/iconpack-obsidian-$_git_sha/Obsidian_light ${pkgdir}/usr/share/icons/Obsidian_light
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
