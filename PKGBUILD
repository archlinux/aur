# Maintainer: justanoobcoder <syaorancode@gmail.com>
pkgname=wayshadow-bin
_pkgname=wayshadow
pkgver=1.0.0
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
sha256sums=('4f95c94dd4bae2c52143ac3ac153ae7129187c996e5ba707116177729b9f2b90')

package() {
    cd "$srcdir"
    cp -a usr "$pkgdir/"
}
