# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=aliza
pkgver=1.98.32
pkgrel=1
pkgdesc="Medical Imaging. Open 2D, 3D and 4D images in DICOM, MetaIO, Nifti, Nrrd and other formats, incl. Meshes in VTK, OBJ and STL formats. Filters, segmentation, front-end for registration with Elastix and many more features"
arch=('x86_64')
url="http://www.aliza-dicom-viewer.com"
license=('custom')
depends=('libxt'
         'hicolor-icon-theme'
         'libglvnd'
         'qt4')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.deb::https://drive.google.com/uc?export=download&id=1MyE5oV_wpFk99XEYAZLlL1l3mesj9_dj")
sha512sums=('11ee0a5169abadfb8948a10dcb05b7cda4234cb5fb0ce82c5873713c7b4d1ab56f220546acf3d0540c3774bcd212b781969a4ca004344f43d9491e56ddf4f666')

package(){
  # Extract package data
  tar xJf data.tar.xz -C "${pkgdir}"
  install -D -m644 "${pkgdir}/usr/share/doc/aliza/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
