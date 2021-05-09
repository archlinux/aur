# Maintainer: Gustavo Jasso <gustavo at jasso dot info>
pkgname="otf-hind"
_reponame=hind
pkgver=2.000
pkgrel=1
pkgdesc='Hind is an Open Source typeface supporting the Devanagari and Latin scripts.'
arch=(any)
url="https://fonts.google.com/specimen/Hind"
license=(OFL)
source=("https://github.com/itfoundry/hind/releases/download/v2.000/Hind-2_000.zip")
sha512sums=('d428737108d9531cbee77be9573618b0bc9337ae0760403934edb9a7d6e3dd1cb4c163fcb93e277a8e088ec706ec88c740e16c127329f30d8a1d76b271101000')

package() {
    cd "$srcdir"
    install -Dm644 ${srcdir}/*.otf -t "${pkgdir}"/usr/share/fonts/OTF/
    install -D -m644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
