# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=fcitx5-lotus-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Vietnamese input method for fcitx5"
arch=('x86_64')
url="https://github.com/LotusInputMethod/fcitx5-lotus"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'fcitx5-qt' 'qt6-base' 'libinput' 'hicolor-icon-theme' 'glibc' 'libstdc++' 'libgcc' 'systemd-libs')
provides=('fcitx5-lotus')
conflicts=('fcitx5-lotus')
source=("https://github.com/LotusInputMethod/fcitx5-lotus/releases/download/v${pkgver}/fcitx5-lotus-v${pkgver}-x86_64-archlinux.tar.zst")
sha256sums=('274eb42fd9aa143617cfba0c96445ea5f619e94140623c902d53e482189c90d1')
install='fcitx5-lotus.install'

package() {
    cd "$srcdir"
    cp -ra usr "$pkgdir/"
}
