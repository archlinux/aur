# Maintainer: Lindenk <ztaticnull@gmail.com>

pkgname=otf-tunic
pkgver=0.2.0
pkgrel=1
pkgdesc="An otf font of the TUNIC writing system. Created by Jon Molnar <jon@cogspace.com>"
arch=('any')
url="https://www.cogspace.com/2022/03/23/tunics-writing-system-new-font-spoilers/"
license=('CC BY 4.0')
source=("https://www.cogspace.com/wp-content/uploads/2022/03/Tunic-Font-v0.2.zip" "https://creativecommons.org/licenses/by/4.0/legalcode.txt")
md5sums=('7f26ee4f562d7a558af27230e61d20b2' '2ab724713fdaf49e4523c4503bfd068d')


package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" "Tunic_v0.2.otf"
  install -Dm644 'legalcode.txt' "$pkgdir/usr/share/licenses/$pkgname/cc-by-4.0.txt"
}