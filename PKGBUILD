# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=fcitx5-lotus-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Vietnamese input method for fcitx5"
arch=('x86_64')
url="https://github.com/LotusInputMethod/fcitx5-lotus"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'libinput' 'hicolor-icon-theme' 'glibc' 'libstdc++' 'libgcc' 'systemd-libs')
provides=('fcitx5-lotus')
conflicts=('fcitx5-lotus')
source=("https://github.com/LotusInputMethod/fcitx5-lotus/releases/download/v${pkgver}/fcitx5-lotus-v${pkgver}.tar.gz")
sha256sums=('c10183ead9ad972dbe17f5a804b525597a501a334563a2c4dc697829afdf9d56')
install='fcitx5-lotus.install'

package() {
    cd "$srcdir"
    cp -ra usr "$pkgdir/"
}
