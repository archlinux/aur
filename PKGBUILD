# Maintainer: Maciej Dems <macdems@gmail.com>

pkgname=aliza-free
pkgver=1.98.57
pkgrel=2
pkgdesc="Medical Imaging. Open 2D, 3D and 4D images in DICOM, MetaIO, Nifti, Nrrd and other formats, incl. This is the last free version of the package."
arch=('x86_64')
url="http://www.aliza-dicom-viewer.com"
license=('custom')
depends=('hicolor-icon-theme'
         'libxt'
         'libglvnd'
         'qt4'
         'glu')
options=('!emptydirs')
source=("aliza-${pkgver}.x86_64.rpm::https://web.archive.org/web/20210327224315/https://doc-0s-0s-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/1lgjid9ti29rdf5ebmd7o58iqhs3gfpo/1616884950000/16072287944266838401/*/1-AXa3tjy_onecW2k7ftjAQl0KGTb0B1Y?e=download")
sha256sums=('2bb167ce633abb5142d639616f3fdc1347f7f6f9f156db5cbd44b0dad4131307')
provides=('aliza')
conflicts=('aliza')

package() {
    cp -a usr ${pkgdir}
}
