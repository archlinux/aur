# Maintainer: Nat Osaka <natthetupper@gmail.com>

# In order to build and install this package, you will need to purchase
# the program from the URL specified in the url field. Download the .zip
# file, extract the .deb and file and place it next to the PKGBUILD before
# running makepkg.

pkgname=quickposes-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="The official Quickposes gesture drawing desktop app. See comments for installation instructions"
arch=('x86_64')
url="https://www.quickposes.com/en/desktop-app"
license=('custom')
depends=("gconf" "libnotify" "libappindicator-gtk2"
         "libxtst" "nss" "libxss")
source=("local://quickposes-desktop-gesture-drawing-app_1.0.1_amd64.deb" "quickposes-bin")
md5sums=('a4edfbb0061f8a08587c71bd287ce6ce' '3d9f145d335179230b20ffef69ca9cf7')

package() {
	tar xvf data.tar.xz -C "${pkgdir}"
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/quickposes-bin" "${pkgdir}/usr/bin/"
}
