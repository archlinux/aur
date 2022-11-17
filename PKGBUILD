# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: FabioLolix

pkgname=free-delta
pkgver=2.9.2
pkgrel=1
pkgdesc="An Open Source System for Processing Taxonomic Descriptions"
arch=('x86_64')
url="http://freedelta.sourceforge.net/"
#url="https://www.delta-intkey.com/"
license=('GPL2')
depends=(gtk2)
source=("https://sourceforge.net/projects/freedelta/files/freedelta/freedelta_${pkgver}_amd64.deb")
sha256sums=('2391b7351e72d74db58ca050eef13883956759ecad681d1bdf5a37c54a0dad5e')

package() {
    install -dDm755 "$pkgdir"/usr/{bin,share/free-delta}

	tar -p -xf data.tar.xz -C "${pkgdir}"
	chmod 755 -R ../pkg/${pkgname}/usr 
}
