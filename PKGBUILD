# Maintainer: Nickolas Gray
pkgver=1.0
pkgrel=1
pkgname=godot-uid-fixer-git
pkgdesc='A program designed to fix the UID error in godot engine. (only does current directory)'
arch=('x86_64')
makedepends=('git' 'gcc')
source=("git+https://github.com/marrcaburgh/godot-uid-fixer.git")
sha256sums=('SKIP')

build() {
    echo "Build ${pkgname}..."
    g++ $srcdir/godot-uid-fixer/main.cpp -o "${srcdir}/godot-uid-fixer/godot-uid-fixer"
}

package() {
    install -Dm755 ${srcdir}/godot-uid-fixer/godot-uid-fixer "${pkgdir}/usr/bin/${pkgname}"
}
