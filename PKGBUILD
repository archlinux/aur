# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
pkgname=openbox-theme-redmond-2009
pkgver=1
pkgrel=1
pkgdesc="A classic style Windows theme with a modern touch."
arch=(any)
url="https://www.box-look.org/p/1017784"
license=('GPL')
depends=('openbox')
source=("https://dl.opendesktop.org/api/files/download/id/1460769169/109595-Redmond%202009.obt")
md5sums=('710d42cee07ad2f8c4aa47213e039254')

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/themes"
	cp -R "${srcdir}/Redmond 2009" "${pkgdir}/usr/share/themes/"
}
