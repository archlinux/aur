# Maintainer: scan

pkgname=dark-aurora-theme
pkgver=20170525
pkgrel=1
pkgdesc="Dark Aurora Theme GNOME 3.20/3.22/3.24"
arch=('any')
url="https://www.gnome-look.org/p/1176541"
license=('GPL')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("Dark-Aurora-Themes.tar.xz::https://www.dropbox.com/s/esufopxzc667zju/Dark-Aurora.tar.gz")
sha256sums=('46c8a9fa840e1dd1dc41422d22d82526e09ff63111ff1d5241ca2a844283faf6')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r Dark-Aurora ${pkgdir}/usr/share/themes/Dark-Aurora
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
