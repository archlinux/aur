pkgname=phyde
pkgver=0.9971
pkgrel=2
pkgdesc="a system-independent editor for DNA and amino acid sequence alignments, designed to assist anybody interested in phylogenetic or other comparative analyses of sequence data"
arch=('any')
url="http://www.phyde.de/"
license=('custom')
depends=('java-environment')
source=("http://www.phyde.de/PhyDE-1.jar.zip" "phyde")
sha256sums=('697929e0bfd2d90a0f430a9e7f7c072c3996bc62748facb252ef40edfedad9b1'
            'e8e741fe77cc12f2440c02ee4cb44ff3c5b906e19d494b94c96656a10fdf29d2')

package(){
	install -Dm 755 PhyDE-1.jar $pkgdir/usr/share/$pkgname/$pkgname.jar
	install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
}
