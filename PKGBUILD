# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=fcitx5-lotus-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Vietnamese input method for fcitx5"
arch=('x86_64')
url="https://github.com/LotusInputMethod/fcitx5-lotus"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'libinput' 'hicolor-icon-theme' 'glibc' 'libstdc++' 'libgcc' 'libudev.so' 'python-qtpy' 'python-dbus')
provides=('fcitx5-lotus')
conflicts=('fcitx5-lotus')
source=("https://github.com/LotusInputMethod/fcitx5-lotus/releases/download/v${pkgver}/fcitx5-lotus-v${pkgver}-x86_64-archlinux.tar.zst")
sha256sums=('fd79fef5cab49416da20d21c097db9373e27958bec400bd2c336524f8cd15fd5')
install='fcitx5-lotus.install'

package() {
    cp -ra "$srcdir"/{usr,etc} "$pkgdir/"
}
