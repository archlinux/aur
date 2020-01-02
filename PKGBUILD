# Maintainer: Alfredo Luque <me@aluque.io>

pkgname='chrysalis'
pkgdesc="A graphical configuration tool for programmable keyboards. Prebuilt AppImage Releases"
pkgver=0.6.2
pkgrel=0
arch=('x86_64')
url='https://github.com/keyboardio/Chrysalis'
license=('GPL3')
depends=()
options=('!strip')
source=("https://github.com/keyboardio/Chrysalis/releases/download/$pkgname-$pkgver/Chrysalis-$pkgver.AppImage")
sha512sums=('71fa67b41b22a94032e9a1a37e6e1f0fd16bb970b674ddab613f974ef9bb7a3d1196910d1782f29d59fed1a741ba29e2894ec580cb160ef2c6e165ee6666bdc4')

package() {
    mkdir -p "$pkgdir/usr/bin"
    chmod +x "$srcdir/Chrysalis-$pkgver.AppImage"
    cp "$srcdir/Chrysalis-$pkgver.AppImage" "$pkgdir/usr/bin/chrysalis"
}
