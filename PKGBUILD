# Maintainer: librewish <librewish@gmail.com>

pkgname=kde-servicemenus-officeconverter
pkgver=1
pkgrel=1
pkgdesc="KDE service menus for converting documents from dolphin"
arch=('any')
license=('GPL')
depends=('dolphin' 'kdialog')
optdepends=('libreoffice')
source=("OfficeConverter.tar.gz")
sha256sums=('d7095ebc2c142fc4f4e8da9757c9295e2b9d00dd27a10bcdd43518df33ac7914')

package() {
    cd "$srcdir/OfficeConverter/data"
  install -dm 755 ${pkgdir}/usr/share/kservices5/ServiceMenus/
  cp -r ServiceMenus/* ${pkgdir}/usr/share/kservices5/ServiceMenus/
  
  install -dm 755 ${pkgdir}/usr/share/OfficeConverterSM/
  cp -r share/* ${pkgdir}/usr/share/

  install -dm 755 ${pkgdir}/usr/bin/
  cp -r bin/* ${pkgdir}/usr/bin/
}

