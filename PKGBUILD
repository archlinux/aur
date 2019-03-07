# Maintainer: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=aliza
pkgver=1.48.7.8
pkgrel=1
pkgdesc="Medical Imaging. Open 2D, 3D and 4D images in DICOM, MetaIO, Nifti, Nrrd and other formats, incl. Meshes in VTK, OBJ and STL formats. Filters, segmentation, front-end for registration with Elastix and many more features."
arch=('x86_64')
url="http://www.aliza-dicom-viewer.com"
license=('custom')
depends=('qt4')
# depends=('dropbox' 'libx11' 'libxt' 'qt4' 'zlib')
options=('!emptydirs')
source=("aliza_$pkgver.deb::https://drive.google.com/uc?authuser=0&id=17hMg1ruMAU4ioxvi0098D8m30EKlWGM7&export=download")
sha512sums=('e61e98c67b9939e48375919f58207113461e633a378915c53eae667086504acd6b0a77dd6c2b0b2a369f88a769e0b9c5899fa1870cff19650267f07e15f5048c')

package(){

	# Extract package data
	tar xJf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/aliza/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
