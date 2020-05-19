# Maintainer: Alfredo Luque <me@aluque.io>

pkgname='chrysalis'
pkgdesc="A graphical configuration tool for programmable keyboards. Prebuilt AppImage Releases"
pkgver=0.7.5
pkgrel=0
arch=('x86_64')
url='https://github.com/keyboardio/Chrysalis'
license=('GPL3')
depends=()
options=('!strip')
source=("https://github.com/keyboardio/Chrysalis/releases/download/$pkgname-$pkgver/Chrysalis-$pkgver.AppImage")
sha512sums=('d1a91d989b14ff182ca120b677cd1236f4cb3b3955cec60f6664629b4215f38e64674c3e1b11c6f888a2f9dbcf08a9cc870bbe1da29bc323af4fbdbcc1a25fc6')

package() {
    mkdir -p "$pkgdir/usr/bin"
    chmod +x "$srcdir/Chrysalis-$pkgver.AppImage"
    cp "$srcdir/Chrysalis-$pkgver.AppImage" "$pkgdir/usr/bin/chrysalis"
}
