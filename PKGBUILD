# Maintainer: allencch <allencch at hotmail dot com>
pkgname=inclusive
pkgver=3.2
pkgrel=4
pkgdesc="Integrated clustering, upstream sequence retrieval and motif sampling"
arch=('i686' 'x86_64')
url="http://homes.esat.kuleuven.be/~sistawww/bioi/thijs/download.html"
license=('custom')
source=("http://homes.esat.kuleuven.be/~sistawww/bioi/thijs/download/linux_3.2/MotifSampler"
"http://homes.esat.kuleuven.be/~sistawww/bioi/thijs/download/linux_3.2/MotifScanner"
"http://homes.esat.kuleuven.be/~sistawww/bioi/thijs/download/linux_3.2/MotifLocator"
"http://homes.esat.kuleuven.be/~sistawww/bioi/thijs/download/linux_3.2/CreateBackgroundModel"
"http://homes.esat.kuleuven.be/~sistawww/bioi/thijs/download/linux_3.2/BackgroundScore"
"http://homes.esat.kuleuven.be/~sistawww/bioi/thijs/download/linux_3.2/MotifComparison"
"http://homes.esat.kuleuven.be/~sistawww/bioi/thijs/download/linux_3.2/MotifRanking")
md5sums=("c2867739e66744c43d6d0005f6d1d6c7"
"c0006d11649daf137797e74e65fdbf95"
"af78e57a9616b198f7b3852854488567"
"056e3ee499260619d9c2f60495ea5384"
"2a7115bd07f18963045b9ffd2d33389f"
"17581d84853154b5493c14e3ccb84516"
"a3e37d685de778678ebaf876a765ab88")


package() {
	mkdir -p "${pkgdir}/usr/bin"
	cd "${srcdir}"
	install -m755 MotifSampler MotifScanner MotifLocator CreateBackgroundModel BackgroundScore MotifComparison MotifRanking "${pkgdir}/usr/bin"
}
