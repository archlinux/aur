# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: FabioLolix

pkgname=free-delta
pkgver=2.9.1
pkgrel=1
pkgdesc="An Open Source System for Processing Taxonomic Descriptions"
arch=('x86_64')
url="http://freedelta.sourceforge.net/"
#url="https://www.delta-intkey.com/"
license=('GPL3')
depends=(gtk2)
source=("https://sourceforge.net/projects/freedelta/files/freedelta/freedelta_${pkgver}_amd64.deb")
sha256sums=('32b1f063ecf9b72727f171f508d40073b8917f254b5c72a09b33edbda3c48297')

package() {
    install -dDm755 "$pkgdir"/usr/{bin,share/free-delta}

	tar -p -xf data.tar.xz -C "${pkgdir}"
	chmod 755 -R ../pkg/${pkgname}/usr 
}
