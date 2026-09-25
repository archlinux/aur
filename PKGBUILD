# Maintainer: justanoobcoder <syaorancode@gmail.com>
pkgname=wayshadow-bin
_pkgname=wayshadow
pkgver=1.0.1
pkgrel=1
pkgdesc="A lightweight, elegant keystroke visualizer for Wayland compositors"
arch=('x86_64')
url="https://github.com/justanoobcoder/wayshadow"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=(
    'wayland'
    'cairo'
    'pango'
    'libinput'
    'libxkbcommon'
    'gtk3'
    'libappindicator'
)
options=(!debug !strip)
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('04acfd9c592038f380d4700c0fe65f867e9c2758bba2abde66f6305970b88ff1')

package() {
    cd "$srcdir"
    cp -a usr "$pkgdir/"
}
