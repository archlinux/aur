# Maintainer: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=aliza
pkgver=1.44.2.6
pkgrel=1
pkgdesc="Medical Imaging. Open 2D, 3D and 4D images in DICOM, MetaIO, Nifti, Nrrd and other formats, incl. Meshes in VTK, OBJ and STL formats. Filters, segmentation, front-end for registration with Elastix and many more features."
arch=('x86_64')
url="http://www.aliza-dicom-viewer.com"
license=('custom')
depends=('qt4')
# depends=('dropbox' 'libx11' 'libxt' 'qt4' 'zlib')
options=('!emptydirs')
source=("aliza_$pkgver.deb::https://drive.google.com/uc?authuser=0&id=1ova2C4NDMWYmrdCY9YUjmfPU0pmnXwBp&export=download")
sha512sums=('eb39cbd6933adeb9d6443288df94188216350d7e334e6f38ef2f4e533889318e16c3b1f47c8f53224f17e5e2b8f5567cc0f0f6aa9f084421d88ada713eb1a1a3')

package(){

	# Extract package data
	tar xzf data.tar.gz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/aliza/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
