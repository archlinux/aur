# Maintainer: Alfredo Luque <me@aluque.io>

pkgname='chrysalis'
pkgdesc="A graphical configuration tool for programmable keyboards. Prebuilt AppImage Releases"
pkgver=0.6.1
pkgrel=0
arch=('x86_64')
url='https://github.com/keyboardio/Chrysalis'
license=('GPL3')
depends=()
options=('!strip')
source=("https://github.com/keyboardio/Chrysalis/releases/download/$pkgname-$pkgver/Chrysalis-$pkgver.AppImage")
sha512sums=('642833550e5a053e2a547955d3c525b521a7d6d6947339f2d67b1f9747643a8d18070f78f14e610cbb4aa83b1452b8697e0450f14cb19672b43bf68f54ab042d')

package() {
    mkdir -p "$pkgdir/usr/bin"
    chmod +x "$srcdir/Chrysalis-$pkgver.AppImage"
    cp "$srcdir/Chrysalis-$pkgver.AppImage" "$pkgdir/usr/bin/chrysalis"
}
