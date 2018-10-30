# Maintainer: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=aliza
pkgver=1.44.6.6
pkgrel=1
pkgdesc="Medical Imaging. Open 2D, 3D and 4D images in DICOM, MetaIO, Nifti, Nrrd and other formats, incl. Meshes in VTK, OBJ and STL formats. Filters, segmentation, front-end for registration with Elastix and many more features."
arch=('x86_64')
url="http://www.aliza-dicom-viewer.com"
license=('custom')
depends=('qt4')
# depends=('dropbox' 'libx11' 'libxt' 'qt4' 'zlib')
options=('!emptydirs')
source=("aliza_$pkgver.deb::https://drive.google.com/uc?authuser=0&id=11JLiL5vNm-9-NsKTvJw26pfGuFnPMKPD&export=download")
sha512sums=('97ea1ab34308d5299e30617f0ef6296fb1ee97a9b5467838b8a1bab307e78957d7e4fa4295186a507e26da77133fb250b240f01cd8a743526c8d17ce2af1415c')

package(){

	# Extract package data
	tar xzf data.tar.gz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/aliza/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
