# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=fcitx5-vmk-bin
pkgver=0.9.4
_tagver=v${pkgver}
pkgrel=1
pkgdesc="VMK (Vietnamese Micro Key) for Fcitx5 - Bộ gõ tiếng Việt mô phỏng UniKey"
arch=('x86_64')
url="https://github.com/nhktmdzhg/VMK"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'libinput' 'hicolor-icon-theme' 'glibc' 'gcc-libs' 'systemd-libs')
provides=('fcitx5-vmk')
conflicts=('fcitx5-vmk')
source=("https://github.com/nhktmdzhg/VMK/releases/download/${_tagver}/fcitx5-vmk-${_tagver}.tar.gz")
sha256sums=('1f2c931c5860ce88a5edcbf6b6b3a67232a4d445789796794a854e3c4a5d9a19')
install='fcitx5-vmk.install'

package() {
    cd "$srcdir"
    cp -ra usr "$pkgdir/"
}
