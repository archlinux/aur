# Maintainer: Gustavo Jasso <gustavo at jasso dot info>
pkgname="otf-hind"
_reponame=hind
pkgver=2.000
pkgrel=1
pkgdesc='Hind is an Open Source typeface supporting the Devanagari and Latin scripts.'
arch=(any)
url="https://fonts.google.com/specimen/Hind"
license=(OFL)
source=("https://github.com/itfoundry/hind/releases/download/v2.000/Hind-2_000.zip"
        "${pkgname}.zip::https://fonts.google.com/download?family=Hind")
sha512sums=('d428737108d9531cbee77be9573618b0bc9337ae0760403934edb9a7d6e3dd1cb4c163fcb93e277a8e088ec706ec88c740e16c127329f30d8a1d76b271101000'
            '81c8541bc146f19898dc9c9a83e46ae53d4aaed92a231b6f0c9abf4e90764b89e3833aece12a1940e9811909bf336f4d93506b3073a6133799dd1a57138b9f21')

package() {
    install -Dm644 ${srcdir}/*.otf -t "${pkgdir}"/usr/share/fonts/OTF/
    install -D -m644 OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
    install -D -m644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
