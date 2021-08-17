# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: FabioLolix

pkgname=free-delta-bin
pkgver=2.8.2
pkgrel=1
pkgdesc="An Open Source System for Processing Taxonomic Descriptions"
arch=('x86_64' 'i386')
url="http://freedelta.sourceforge.net/"
#url="https://www.delta-intkey.com/"
license=('GPL3')
depends=(gtk2)
source_i386=("https://sourceforge.net/projects/freedelta/files/freedelta/freedelta_${pkgver}_i386.deb")
source_x86_64=("https://sourceforge.net/projects/freedelta/files/freedelta/freedelta_${pkgver}_amd64.deb")
sha256sums_x86_64=('90f9ce3bb0cedeb9ddb44a8e17bfedda38615fe16b7743b76332109443c32a29')
sha256sums_i386=('96f0919dfd324737fc66f0b1fb78ec11a6aefe35de2441baa97f2e4de0050af8')

package() {
    install -dDm755 "$pkgdir"/usr/{bin,share/free-delta}

	tar -p -xf data.tar.xz -C "${pkgdir}"
	chmod 755 -R ../pkg/${pkgname}/usr 
}
