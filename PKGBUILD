# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=nona
pkgver=2.0
pkgrel=9
pkgdesc="NONA: a bastard son of Pee-Wee. Phylogenetic Analysis Software"
arch=('any')
url="http://www.lillo.org.ar/phylogeny/Nona-PeeWee/readme.htm"
license=('custom')
source=("http://www.lillo.org.ar/phylogeny/Nona-PeeWee/nona-linux.tar.gz")
sha256sums=('40698b797a3d58707521dd3cea0ebdf3f80ff5c1075382f98b81860fc426de69')

package() {
	
	install -dm755 "$pkgdir"/usr/{bin,share/doc/$pkgname}
	install -Dm755 ${srcdir}/piwe.doc ${pkgdir}/usr/share/doc/$pkgname/piwe.doc
	chmod +x $srcdir/nona
	install -Dm755 $srcdir/nona $pkgdir/usr/bin/Nona-PeeWee 
	
}
