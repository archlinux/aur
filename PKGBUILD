# Maintainer: parazyd <parazyd@dyne.org>
pkgname=gtomb
pkgver=0.7.1
pkgrel=3
pkgdesc="GUI wrapper for Tomb, the crypto undertaker"
arch=('any')
url="https://github.com/parazyd/gtomb"
license=('GPL3')
depends=('zenity' 'tomb')
source=("https://pub.projectarch.tk/mirror/gtomb/$pkgname-$pkgver.tar.gz")
sha512sums=('0bb65283033bbaa2cf9230bf6ada3c02add204c74e21522fbc985aed0e44b6f1dcacdd3116d63133b3b3d0bd53dbf7e95e27fe0e73fb935c197e01c8d37a16b4')
validpgpkeys=('6CB46C63641DB1F1F8115B3ABB5E2E35B92E373E')

package() {
    cd $pkgname-$pkgver
    install -D -m 755 gtomb $pkgdir/usr/bin/gtomb

    printf "\n\n*******************IMPORTANT*******************\n\n"
    printf "Edit /usr/bin/gtomb if your tomb executable\n path is different from /usr/bin/tomb"
    printf "If you installed tomb from the AUR, you should be okay."
    printf "\n\n***********************************************\n\n"
}
