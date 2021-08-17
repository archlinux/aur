# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=papirus-paleorange-icon-theme
pkgver=20210802
pkgrel=1
pkgdesc="Papirus-PaleOrange icon theme"
arch=('any')
url="https://www.pling.com/p/1549558"
license=('Unknown')
makedepends=('gtk-update-icon-cache')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
options=('strip')
source=("https://tsbarnes-111646473473.s3-accesspoint.us-east-1.amazonaws.com/Papirus-Paleorange_20210802.tar.gz")

package() {
	cp -r Papirus-PaleOrange "$pkgdir/usr/share/icons/"
}
