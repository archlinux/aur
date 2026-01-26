# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=fcitx5-vmk-bin
pkgver=0.9.3alpha3
_tagver=v0.9.3-alpha3
pkgrel=1
pkgdesc="VMK (Vietnamese Micro Key) for Fcitx5 - Bộ gõ tiếng Việt mô phỏng UniKey"
arch=('x86_64')
url="https://github.com/nhktmdzhg/VMK"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'libinput' 'hicolor-icon-theme' 'glibc' 'gcc-libs' 'systemd-libs')
provides=('fcitx5-vmk')
conflicts=('fcitx5-vmk')
source=("https://github.com/nhktmdzhg/VMK/releases/download/${_tagver}/fcitx5-vmk-${_tagver}.tar.gz")
sha256sums=('bcc02761993d042a0a6a41031927fae79f35180561f64f4e851612566277a56f')
install='fcitx5-vmk.install'

package() {
    cd "$srcdir"
    cp -ra usr "$pkgdir/"
}
