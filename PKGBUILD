# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Moritz Lüdecke <ritze at skweez dot net>
# Contributor: boenki <boenki at gmx dot de>
#
pkgname="cover-thumbnailer"
pkgver="0.10.0"
pkgrel="1"
pkgdesc="A Python script which generates folder thumbnails for various file browser on Linux. It displays music album covers, preview of pictures which are in a folder and more."
arch=('i686' 'x86_64')
url="https://github.com/flozz/cover-thumbnailer"
license=('GPL3')
depends=('python-pillow')
conflicts=("${pkgname}"-git)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('dc54c9308e2b6b7d4c182b2bacfa7b46bb4bedc486565f5285e0e2a1772f52e4')

install="${pkgname}.install"

package() {
	cd "${pkgname}-${pkgver}"

	./install.sh -p ${pkgdir}

    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
