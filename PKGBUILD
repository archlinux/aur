# Maintainer: furistar <aur@mady.moe>

font=grazie-mille
pkgname=ttf-${font}-var
pkgver=1.0.0
pkgrel=1
pkgdesc="A variable serif font based on the Lora typeface."
arch=("any")
url="https://fontesk.com/designer/michele-casanova"
license=("custom:OFL")
source=("${font}.zip::https://fontesk.com/download/153112/")
sha256sums=("0e915ded79c94e6b8426dd787ec61f3c5a3310e6f2ec0ebd951736c9da57e50b")

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -Dm644 ${srcdir}/variable/GrazieMille.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -Dm644 ${srcdir}/variable/GrazieMille_it.ttf ${pkgdir}/usr/share/fonts/TTF/

  install -Dm644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
