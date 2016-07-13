# Maintainer: DiogoNSilva <o.diogosilva@gmail.com>
# Contributor: Stunts <f.pinamartins@gmail.com>

_pkgname=TriFusion
pkgname=trifusion-bin
pkgver=0.4.11
pkgrel=1
pkgdesc="Streamlining phylogenomic data gathering, processing and visualization"
arch=("any")
url="https://github.com/ODiogoSilva/TriFusion"
license=("GPL3")
conflicts=("trifusion-git" "trifusion")
source=("https://github.com/ODiogoSilva/${_pkgname}/releases/download/${pkgver}/trifusion-bin-${pkgver}-arch.tar.xz")
md5sums=("27339740b0c706e839b27ab2a45e5f1d")

package() {
	cd ${srcdir}
	mv trifusion-bin-${pkgver}-linux-arch TriFusion
	install -Dm755 TriFusion "${pkgdir}/usr/bin/TriFusion"
	install -Dm644 trifusion.desktop "${pkgdir}/usr/share/applications/trifusion.desktop"
	install -Dm644 trifusion-icon-128.png "${pkgdir}/usr/share/pixmaps/trifusion-icon-128.png"
}
