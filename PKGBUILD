# Maintainer: Decrypted Epsilon <decrypted.epsilon (at) gmail (dot) com>

pkgname=seqan
pkgver=2.1.1
pkgrel=1
pkgdesc="SeqAn is an open source C++ library of efficient algorithms and data structures for the analysis of sequences with 
the focus on biological data"
arch=("any")
url="http://www.seqan.de"
license=('BSD')
# depends=()
source=("http://packages.seqan.de/seqan-library/${pkgname}-library-${pkgver}.tar.xz")
sha256sums=('8926f91fec5ce57e8efc70ac16cbf041bde0e0be463685b86e0d2e1e6a8169d7')

package() {
    mkdir -p $pkgdir/usr/share/doc/$pkgname
    mkdir -p $pkgdir/usr/include/$pkgname
    cp -rf "${srcdir}/${pkgname}-library-${pkgver}/include/${pkgname}/" $pkgdir/usr/include/
    cp -rf "${srcdir}/${pkgname}-library-${pkgver}/share/doc/${pkgname}/" $pkgdir/usr/share/doc/
}
