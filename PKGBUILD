# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=fcitx5-lotus-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Vietnamese input method for fcitx5"
arch=('x86_64')
url="https://github.com/LotusInputMethod/fcitx5-lotus"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'libinput' 'hicolor-icon-theme' 'glibc' 'libstdc++' 'libgcc' 'libudev.so' 'pyside6' 'python-dbus')
provides=('fcitx5-lotus')
conflicts=('fcitx5-lotus')
source=("https://github.com/LotusInputMethod/fcitx5-lotus/releases/download/v${pkgver}/fcitx5-lotus-v${pkgver}-x86_64-archlinux.tar.zst")
sha256sums=('2c86260ad6baaa1a8a29e68e1ec83ecb190fa03d5872d948a82462026f71c1bd')
install='fcitx5-lotus.install'

package() {
    cp -ra "$srcdir"/{usr,etc} "$pkgdir/"
}
