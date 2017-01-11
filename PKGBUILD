# Maintainer: Decrypted Epsilon <decrypted.epsilon (at) gmail (dot) com>

pkgname=seqan
pkgver=2.3.1
pkgrel=1
pkgdesc="SeqAn is an open source C++ library of efficient algorithms and data structures for the analysis of sequences with 
the focus on biological data"
arch=("any")
url="http://www.seqan.de"
license=('BSD')
# depends=()
source=("http://packages.seqan.de/seqan-library/${pkgname}-library-${pkgver}.tar.xz")
sha256sums=('79df48e97373dd8612913fe66d7aaa03288d09859dcf918bcb4a5f754ec7af7a')

package() {
    mkdir -p $pkgdir/usr/share/doc/$pkgname
    mkdir -p $pkgdir/usr/include/$pkgname
    cp -rf "${srcdir}/${pkgname}-library-${pkgver}/include/${pkgname}/" $pkgdir/usr/include/
    cp -rf "${srcdir}/${pkgname}-library-${pkgver}/share/doc/${pkgname}/" $pkgdir/usr/share/doc/
}
