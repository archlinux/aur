# Maintainer: Joshua Hardy joshinsilico@gmail.com
pkgname=resmap
pkgver=1.1.4
pkgrel=1
pkgdesc="Computes the local resolution of 3D density maps from structural biology and cryo-EM"
arch=(x86_64)
url="http://resmap.sourceforge.net"
license=('CCPL:cc-by-nc-nd-3.0')
depends=()
makedepends=()
optdepends=()
source=("https://downloads.sourceforge.net/project/resmap/ResMap-${pkgver}-linux64" 
"https://downloads.sourceforge.net/project/resmap/src/ResMap-${pkgver}-src.zip")
md5sums=('ed7381adf8282c6c1033b52f0c1b13c7' '8465e7e6475f2d8383ac322494bb0da4')
package() {
	cd "${srcdir}"/
	install -d "${pkgdir}"/usr/bin "${pkgdir}"/opt/resmap
	cp -r "${srcdir}"/* "${pkgdir}"/opt/resmap/.
	install -D -m755 "${srcdir}"/ResMap-${pkgver}-linux64 "${pkgdir}"/usr/bin/resmap
}
