# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=aliza
pkgver=1.98.43
pkgrel=1
pkgdesc="Medical Imaging. Open 2D, 3D and 4D images in DICOM, MetaIO, Nifti, Nrrd and other formats, incl. Meshes in VTK, OBJ and STL formats. Filters, segmentation, front-end for registration with Elastix and many more features"
arch=('x86_64')
url="http://www.aliza-dicom-viewer.com"
license=('custom')
depends=('hicolor-icon-theme'
         'libxt'
         'libglvnd')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.deb::https://drive.google.com/uc?export=download&id=1tNq23my6Ts0ufi4Wfu7Hy1ep7tmlbKBz")
sha512sums=('e777096910acd8571d61953ee4db6326128ed3907504217b8703d8dce19b3c2f39c634a3dd052242bb790d580f7f7d2dff5a0bce567a94982be1798ba5c6d2f6')

package(){
  tar xJf data.tar.xz -C "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/share/doc/aliza/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
