# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: scan

# Default color: https://aur.archlinux.org/packages/obsidian-icon-theme/
# Green color: https://aur.archlinux.org/packages/obsidian-icon-theme-green/
# Gray color: https://aur.archlinux.org/packages/obsidian-icon-theme-gray/

pkgname=obsidian-icon-theme-green
pkgver=20170709
pkgrel=1
pkgdesc="Obsidian Icon Theme - Green Color"
arch=('any')
url="https://www.gnome-look.org/p/1169579"
license=('GPL')
_git_sha=0d8b39f7b41509a654f72e6a19a8e7dd6f985940
source=(
	"https://github.com/madmaxms/iconpack-obsidian/archive/$_git_sha.tar.gz"
)
sha256sums=(
	'd939d421d86bf2c2e64544c6e70df29fd847c45fec83cdb94294eeea2ba8a81c'
)

package() {
	install -d ${pkgdir}/usr/share/icons
	cp -r ${srcdir}/iconpack-obsidian-$_git_sha ${pkgdir}/usr/share/icons/Obsidian_green
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
