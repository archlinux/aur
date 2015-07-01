# Maintainer: XZS <d dot f dot fischer at web dot de>
pkgname=google-desktop-links
pkgver=4
pkgrel=1
pkgdesc="provides links to Google pages as desktop files"
arch=('any')
url="http://google.com/"
license=('GPL')
depends=('xdg-utils')
install=${pkgname}.install
source=(google.desktop
        google-maps.desktop
        gmail.desktop
        google-calendar.desktop
        google-contacts.desktop
        google-drive.desktop
        google-keep.desktop
        google.png
        google-maps.png
        gmail.png
        google-drive.png
        google-keep.png)
md5sums=('4046843170152bd93926bdd720ebae35'
         '830730ca79b8baaf12467b17500b39a5'
         '9c4f9894bc9e3892f6f1b60fb3501ba8'
         '4b451df8ac7034080581870a91ba3de9'
         'b166c242b56cee102eed4cffb2d417e5'
         'd8c1f8f928dea2624beed185e492bd1d'
         'bd18adf71c81c5c86006fa209ebeddef'
         '9a3fabe9dcbd39d640dbcf9d787f10f1'
         '54100858071e06f1fe6b9c6236b435f6'
         'f4018d18cf21b424b752de3f9aa8b37f'
         '15df9cda226a334391f42a87e260eb2a'
         '080e2df934aa787008f18506bbe7f1ae')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}"/usr/share/{icons/hicolor/128x128/apps,applications}
  install -m644 *.desktop "${pkgdir}/usr/share/applications"
  install -m644 *.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
}
