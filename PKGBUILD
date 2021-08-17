# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=papirus-paleorange-icon-theme
pkgver=20210802
pkgrel=1
pkgdesc="Papirus-Paleorange icon theme"
arch=('any')
url="https://www.pling.com/p/1549558"
license=('Unknown')
makedepends=('gtk-update-icon-cache')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
options=('!strip')
source=("https://www.dropbox.com/s/eyv26chd3qew1ir/Papirus-Paleorange_20210802.tar.gz")
md5sums=("cc11c414778ee2e798c20a23c223ff7c")

package() {
	mkdir -p "$pkgdir/usr/share/icons"
	cp -r Papirus-Paleorange "$pkgdir/usr/share/icons/"
}
