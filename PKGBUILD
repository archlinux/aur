# Maintainer: Alfredo Luque <me@aluque.io>
# Maintainer: Paul Mourer <paul.mourer@gmail.com>

pkgname='chrysalis'
pkgdesc="A graphical configuration tool for programmable keyboards. Prebuilt AppImage Releases"
pkgver=0.7.9
pkgrel=0
arch=('x86_64')
url='https://github.com/keyboardio/Chrysalis'
license=('GPL3')
depends=()
options=('!strip')
source=("https://github.com/keyboardio/Chrysalis/releases/download/$pkgname-$pkgver/Chrysalis-$pkgver.AppImage")
sha512sums=('62a57c37783151f77a0a4b6ff02b90420df36483e7a1f7a8d761cc0ebdf37bfdf738755b187f8e3f3969f5b981e0fd136dde55e80a850372168d391d9b4b2371')

package() {
    mkdir -p "$pkgdir/usr/bin"
    chmod +x "$srcdir/Chrysalis-$pkgver.AppImage"
    cp "$srcdir/Chrysalis-$pkgver.AppImage" "$pkgdir/usr/bin/chrysalis"
}
