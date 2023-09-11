# Maintainer: Jordan Day < jordanday444 at gmail dot com >
# Contributor: Michael Mansell <michael.mansell@gmail.com>

pkgname=gimp-script-divide-scanned-images
pkgver=2.2F
pkgrel=6
pkgdesc="GIMP Scheme (.scm) script for splitting separate sub-images from a composite image that has a uniform background. Creates a new image from each; will call the \'deskew\' plugin on each image (if it is installed)."

arch=('any')
url="https://github.com/FrancoisMalan/DivideScannedImages"
license=('GPL')

depends=('gimp')
makedepends=('git')
optdepends=('gimp-plugin-deskew-git: Used to straighten split images.')

source=("git+https://github.com/FrancoisMalan/DivideScannedImages")
md5sums=('SKIP')

provides=('gimp-script-divide-scanned-images')

# doesn't need to build, just install

package() {
	install -Dm644 "${srcdir}/DivideScannedImages/DivideScannedImages.scm" "${pkgdir}/usr/share/gimp/2.0/scripts/DivideScannedImages.scm"
}



