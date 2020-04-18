# Maintainer: Alfredo Luque <me@aluque.io>

pkgname='chrysalis'
pkgdesc="A graphical configuration tool for programmable keyboards. Prebuilt AppImage Releases"
pkgver=0.7.4
pkgrel=0
arch=('x86_64')
url='https://github.com/keyboardio/Chrysalis'
license=('GPL3')
depends=()
options=('!strip')
source=("https://github.com/keyboardio/Chrysalis/releases/download/$pkgname-$pkgver/Chrysalis-$pkgver.AppImage")
sha512sums=('1dd9dba6e89719db7be5087326c5493a76d4bde826d6507af6c92e495682b3108d2bb45e954d6e7dc26650d740b4b11daedcfec8f68caf6321d0cb6c1dfdd7ab')

package() {
    mkdir -p "$pkgdir/usr/bin"
    chmod +x "$srcdir/Chrysalis-$pkgver.AppImage"
    cp "$srcdir/Chrysalis-$pkgver.AppImage" "$pkgdir/usr/bin/chrysalis"
}
