# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=fcitx5-vmk-bin
pkgver=0.9.5.1
pkgrel=1
pkgdesc="VMK (Vietnamese Micro Key) for Fcitx5 - Bộ gõ tiếng Việt mô phỏng UniKey"
arch=('x86_64')
url="https://github.com/nhktmdzhg/VMK"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'libinput' 'hicolor-icon-theme' 'glibc' 'gcc-libs' 'systemd-libs')
provides=('fcitx5-vmk')
conflicts=('fcitx5-vmk')
source=("https://github.com/nhktmdzhg/VMK/releases/download/v${pkgver}/fcitx5-vmk-v${pkgver}.tar.gz")
sha256sums=('846cea5d5952b65b85154a3c816319c6cf3edc1140df9c68cc56f5f18e5535cf')
install='fcitx5-vmk.install'

package() {
    cd "$srcdir"
    cp -ra usr "$pkgdir/"
}
