# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Decrypted Epsilon <decrypted.epsilon (at) gmail (dot) com>

pkgname=seqan
pkgver=2.4.0
pkgrel=1
pkgdesc="SeqAn is an open source C++ library of efficient algorithms and data structures for the analysis of sequences with the focus on biological data"
arch=("any")
url="http://www.seqan.de"
license=('BSD')
# depends=()
source=("http://packages.seqan.de/seqan-library/${pkgname}-library-${pkgver}.tar.xz")
sha256sums=('dd97b1514ab83acb7d7be911b157979e188e8ca72cc61c430c1e0fd03bcd41a5')

package() {
    mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
    mkdir -p ${pkgdir}/usr/include/${pkgname}
    cp -rf "${srcdir}/${pkgname}-library-${pkgver}/include/${pkgname}/" ${pkgdir}/usr/include/
    cp -rf "${srcdir}/${pkgname}-library-${pkgver}/share/doc/${pkgname}/" ${pkgdir}/usr/share/doc/
}
