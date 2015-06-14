# Maintainer: Decrypted Epsilon <decrypted.epsilon (at) gmail (dot) com>

pkgname=seqan
pkgver=2.0.0
pkgrel=1
pkgdesc="SeqAn is an open source C++ library of efficient algorithms and data structures for the analysis of sequences with 
the focus on biological data"
arch=("any")
url="http://www.seqan.de"
license=('BSD')
# depends=()
source=("http://packages.seqan.de/seqan-library/${pkgname}-library-${pkgver}.tar.bz2")
sha512sums=('7dc1adb9596c940f3b8fb71bb5b23c5789ddbc215d14c614e8220acd91ba9da3c7ecba48fbdb38bd2d1010870452d9b161eb3b41fd88183e10331247a5365070')

package() {
    mkdir -p $pkgdir/usr/share/doc/$pkgname
    mkdir -p $pkgdir/usr/include/$pkgname
    cp -rf "${srcdir}/${pkgname}-library-${pkgver}/include/${pkgname}/" $pkgdir/usr/include/
    cp -rf "${srcdir}/${pkgname}-library-${pkgver}/share/doc/${pkgname}/" $pkgdir/usr/share/doc/
}
