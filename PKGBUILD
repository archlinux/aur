# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: scan

pkgname=obsidian-icon-theme
pkgver=20170626
pkgrel=1
pkgdesc="Obsidian Icon Theme"
arch=('any')
url="https://www.gnome-look.org/p/1169579"
license=('GPL')
_git_sha=2c3a5f4fe3c6e3022bdbb8136b9b0452499a08ef
source=(
	"https://github.com/madmaxms/iconpack-obsidian/archive/$_git_sha.tar.gz"
)
sha256sums=(
	'94946d5b92ddce509a6fb1f3b563581f74c199e6f4d7962efdb2b7bae70bd128'
)

package() {
	install -d ${pkgdir}/usr/share/icons
	cp -r ${srcdir}/iconpack-obsidian-$_git_sha ${pkgdir}/usr/share/icons/Obsidian
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
