# Maintainer: Joshua Hardy joshinsilico
pkgname=xds-viewer
pkgver=0.6
pkgrel=1
pkgdesc="Program for viewing X-ray diffraction and control images in the context of data processing by the X-ray Detector Software."
arch=(x86_64)
url="https://sourceforge.net/projects/xds-viewer/"
license=('GPL')
depends=('')
makedepends=('')
optdepends=('xds')
source=("http://downloads.sourceforge.net/project/xds-viewer/xds-viewer/xds-viewer-0.6/xds-viewer-0.6")
md5sums=('50add18f07dd8b720ccfc61c452c2f75')
package() {
	install -D -m755 "${srcdir}"/$pkgname-$pkgver "${pkgdir}"/usr/bin/xds-viewer
}
