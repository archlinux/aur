# Maintainer: xXR01I1Xx <xxr01i1xx@tuta.io>
pkgname=quantum-tetris
pkgver=1.0
pkgrel=2
pkgdesc="Quantum Tetris is your traditional tetris game which has several twists based on the concepts of quantum computing."
arch=("x86_64")
url="http://quantumtetris.com/"
license=('MIT')
install=$pkgname.install
source=(https://gitlab.com/xXR01I1Xx/quantumtetrisaur/-/archive/v$pkgver/quantumtetrisaur-v$pkgver.tar.gz)
sha512sums=("a879c54c455b8758cf31ae39d5536ea851a38f9a5982bdaedd8fe5ece2e84fe3c2eb12917cda2b98325cef9e24cc017312f3b478f5662811718a2f8ec8cde5b4")

package() {
    mkdir -p $pkgdir/opt/$pkgname
    cp "$srcdir/quantumtetrisaur-v$pkgver/Quantum Tetris.x86_64" "$srcdir/quantumtetrisaur-v$pkgver/Quantum Tetris.pck" "$srcdir/quantumtetrisaur-v$pkgver/quantum-tetris" "$srcdir/quantumtetrisaur-v$pkgver/quantum-tetris.desktop" $pkgdir/opt/$pkgname
}
