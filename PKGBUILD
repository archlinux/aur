# Maintainer: Guoyi（"malacology"）<guoyizhang@malacology.net>
# Contributor: Guoyi（"malacology"）<guoyizhang@malacology.net>
# Contributor: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>

pkgname=gblocks
_pkgname=Gblocks
provides=("gblocks")
pkgver=0.91b
pkgrel=7
pkgdesc="A program written in ANSI C language that eliminates poorly aligned \
	 positions and divergent regions of an alignment of DNA or protein sequences. https://doi.org/10.1093/oxfordjournals.molbev.a026334"
url='https://www.biologiaevolutiva.org/jcastresana/Gblocks.html'
arch=('x86_64')
license=('unknown')
depends=('glibc')
source=("https://www.biologiaevolutiva.org/jcastresana/${_pkgname}/${_pkgname}_Linux64_${pkgver}.tar.Z")
sha256sums=('563658f03cc5e76234a8aa705bdc149398defec813d3a0c172b5f94c06c880dc')
package() {
  install -Dm755 ${_pkgname}_$pkgver/$_pkgname "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 ${_pkgname}_$pkgver/Documentation/Gblocks_documentation.html  $pkgdir/usr/share/doc/$_pkgname/Gblocks_documentation.html
}
