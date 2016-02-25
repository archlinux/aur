# Maintainer: Joshua Hardy joshinsilico
pkgname=adxv
pkgver=1.9.10
pkgrel=1
pkgdesc="Display and analyse X-ray crystallography diffraction images"
arch=(x86_64)
url="www.scripps.edu/tainer/arvai/adxv.html"
license=('GPL')
depends=('libxt' 'mesa')
source=("http://www.scripps.edu/tainer/arvai/adxv/adxv_$pkgver/$pkgname.x86_64Centos5")

package() {
	install -d "${pkgdir}"/usr "${pkgdir}"/usr/bin
	install -D -m755 "${srcdir}"/$pkgname.x86_64Centos5 "${pkgdir}"/usr/bin/$pkgname
}
md5sums=('b6d3a5390418e7905c305f9c15bf964d')
