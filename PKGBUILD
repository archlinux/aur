# Maintainer: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=aliza
pkgver=1.48.23.1
pkgrel=1
pkgdesc="Medical Imaging. Open 2D, 3D and 4D images in DICOM, MetaIO, Nifti, Nrrd and other formats, incl. Meshes in VTK, OBJ and STL formats. Filters, segmentation, front-end for registration with Elastix and many more features."
arch=('x86_64')
url="http://www.aliza-dicom-viewer.com"
license=('custom')
depends=('qt4')
# depends=('dropbox' 'libx11' 'libxt' 'qt4' 'zlib')
options=('!emptydirs')
source=("aliza_$pkgver.deb::https://drive.google.com/uc?authuser=0&id=17KKCvurRW-PMOLOxukKUGMJt2C7Ky1lX&export=download")
sha512sums=('fcda0c295f3799478d1d33f5f28dfe22f26e1c86872c66bc5bc2e22966e09d385c57246a4c89163fb6877ca7840946bb22f7f3b27206011a10d94c8c0bd01e27')

package(){

	# Extract package data
	tar xJf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/aliza/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
