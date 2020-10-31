# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=aliza
pkgver=1.98.37
pkgrel=1
pkgdesc="Medical Imaging. Open 2D, 3D and 4D images in DICOM, MetaIO, Nifti, Nrrd and other formats, incl. Meshes in VTK, OBJ and STL formats. Filters, segmentation, front-end for registration with Elastix and many more features"
arch=('x86_64')
url="http://www.aliza-dicom-viewer.com"
license=('custom')
depends=('hicolor-icon-theme'
         'qt5-base')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.deb::https://drive.google.com/uc?export=download&id=1Vv4LYdBwdMlK80UB2IZwJugTcdPcfRdV")
sha512sums=('090112a560dd40a2455b5b06f460e2742f3cb16aad8d14067d5224885deab87214e14ee594f9c46d9f2b9f89690616c030f69f75135e44a09bf63abadb87baf5')

package(){
  # Extract package data
  tar xJf data.tar.xz -C "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/share/doc/aliza/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
