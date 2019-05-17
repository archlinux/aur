# Maintainer: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=aliza
pkgver=1.48.10.9
pkgrel=1
pkgdesc="Medical Imaging. Open 2D, 3D and 4D images in DICOM, MetaIO, Nifti, Nrrd and other formats, incl. Meshes in VTK, OBJ and STL formats. Filters, segmentation, front-end for registration with Elastix and many more features."
arch=('x86_64')
url="http://www.aliza-dicom-viewer.com"
license=('custom')
depends=('qt4')
# depends=('dropbox' 'libx11' 'libxt' 'qt4' 'zlib')
options=('!emptydirs')
source=("aliza_$pkgver.deb::https://drive.google.com/uc?authuser=0&id=1Xki-1eYLgsGrXwgNzWPFlAxhL0Xuvm1o&export=download")
sha512sums=('650b0c751aa6ea1f6da4be0a70cae9a75626c6eaad592231fb71aab926d8bc3607d7e4028634a8df2949537e48c9e9f359a362142a7cbb02419c8da8bbb06b6b')

package(){

	# Extract package data
	tar xJf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/aliza/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
