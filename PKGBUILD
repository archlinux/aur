# Maintainer: scan

_gitname=167239-EleganZe
_pkgname=EleganZe
pkgname=gnome-shell-theme-eleganze
pkgver=0.2.1
pkgrel=2
pkgdesc="EleganZe GNOME Shell theme for GNOME 3.16/3.18"
arch=('any')
url="http://opendesktop.org/content/show.php?content=167239"
license=('GPL3')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("EleganZe.tar.gz::http://opendesktop.org/CONTENT/content-files/${_gitname}.tar.gz")
md5sums=('c27ef9da8324df07d9cd7bee16358808')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r EleganZe\ 3.16 ${pkgdir}/usr/share/themes/${_pkgname}
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
