# Maintainer: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=aliza
pkgver=1.45.6.8
pkgrel=1
pkgdesc="Medical Imaging. Open 2D, 3D and 4D images in DICOM, MetaIO, Nifti, Nrrd and other formats, incl. Meshes in VTK, OBJ and STL formats. Filters, segmentation, front-end for registration with Elastix and many more features."
arch=('x86_64')
url="http://www.aliza-dicom-viewer.com"
license=('custom')
depends=('qt4')
# depends=('dropbox' 'libx11' 'libxt' 'qt4' 'zlib')
options=('!emptydirs')
source=("aliza_$pkgver.deb::https://drive.google.com/uc?authuser=0&id=1v4e_T9pfCIkV-pv1kUprNn0OpU-EeHfA&export=download")
sha512sums=('face776b5a436e29413999ce25c0ae1b2b9e0fbf75fc5615aab2b872d64bc2bd3040760dc1568498c9aecf0d6f722688d6e3df723c6e1bad5f5023e82bdb9a5f')

package(){

	# Extract package data
	tar xJf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/aliza/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
