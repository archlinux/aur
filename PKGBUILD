# maintainer: verse <versedev.store@proton.me>
pkgname=clak-bin
_pkgname=clak
pkgver=0.2.4
pkgrel=1
pkgdesc="Fast and highly stable Vietnamese input method for Fcitx5 and Wayland (precompiled binary)"
arch=('x86_64')
url="https://github.com/versenilvis/clak"
license=('0BSD')
depends=('fcitx5' 'hicolor-icon-theme' 'libinput' 'systemd-libs')
provides=('clak' 'fcitx5-clak')
conflicts=('clak' 'fcitx5-clak')
options=('!debug' '!strip')
install=clak-bin.install
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-$CARCH.tar.gz")
sha256sums=('SKIP')

package() {
    cp -dr --no-preserve=ownership "$srcdir/usr" "$pkgdir/"
}
