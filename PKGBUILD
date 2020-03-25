# Maintainer: xXR01I1Xx <xxr01i1xx@tuta.io>
pkgname=quantum-tetris
pkgver=1.0
pkgrel=3
pkgdesc="Quantum Tetris is your traditional tetris game which has several twists based on the concepts of quantum computing."
arch=("x86_64")
url="http://quantumtetris.com/"
license=('MIT')
install=$pkgname.install
source=('http://quantumtetris.com/games/QuantumTetrisLinux.tar.gz'
        'quantum-tetris.desktop')
sha256sums=('30601d55fcf1eda550498014c4dd16dbb1a95a05ac455e045f7e6c1f9f25031d'
            '04a07f84a5324404d02e7482eb491b16261471fa43057dd10b67dc84e8b53c9f')
noextract=('QuantumTetrisLinux.tar.gz')

package() {
    mkdir -p $pkgdir/opt/$pkgname
    mkdir -p $pkgdir/usr/share/applications
    tar xf $srcdir/QuantumTetrisLinux.tar.gz -C $pkgdir/opt/$pkgname
    cp $srcdir/quantum-tetris.desktop $pkgdir/usr/share/applications/quantum-tetris.desktop
}
