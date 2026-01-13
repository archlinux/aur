# Maintainer: marrcaburgh
pkgver=1.3
pkgrel=2
pkgname=godot-uid-fixer-git
pkgdesc='A program designed to fix the UID error in godot engine.'
arch=('x86_64')
makedepends=('git' 'gcc')
source=("git+https://github.com/marrcaburgh/godot-uid-fixer.git")
sha256sums=('SKIP')

build() {
    binname=godot-uid-fixer
    echo "Build ${pkgname}..."
    g++ $srcdir/godot-uid-fixer/main.cpp -o "${srcdir}/godot-uid-fixer/${binname}"
}

package() {
    binname=godot-uid-fixer
    install -Dm755 ${srcdir}/godot-uid-fixer/$binname "${pkgdir}/usr/bin/${binname}"
}
