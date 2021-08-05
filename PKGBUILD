# Maintainer: librewish <librewish@gmail.com>

pkgname=kde-servicemenus-pdf-encrypt-decrypt
pkgver=1
pkgrel=1
pkgdesc="KDE service menus for encrypting/decrypting PDF documents from dolphin"
arch=('any')
license=('GPL')
depends=('dolphin' 'kdialog' 'pdftk' 'qpdf')
source=("decryptpdf.desktop"
        "encryptpdf.desktop"
        "decryptpdf")
sha256sums=('a0dcfc6795da6fd46e8b570b8d0104b2eba19c585c0dc85056541531ecd963d7'
            '694547f614248e8912a6ae1cde9ddcc1f21a233b3e92370025899b8e89b9cbc6'
            '6a4f364983db986fb1142e640d02586940cfb3cd589508931e1609e61a3b332d')

package() {
  install -dm 755 ${pkgdir}/usr/share/kservices5/ServiceMenus/
  install -m 644 *.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/
  
  install -dm 755 ${pkgdir}/usr/bin/
  install -m 755 decryptpdf ${pkgdir}/usr/bin/
}

