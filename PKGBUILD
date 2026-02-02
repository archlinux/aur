# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=fcitx5-vmk-bin
pkgver=0.9.5
pkgrel=1
pkgdesc="VMK (Vietnamese Micro Key) for Fcitx5 - Bộ gõ tiếng Việt mô phỏng UniKey"
arch=('x86_64')
url="https://github.com/nhktmdzhg/VMK"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'libinput' 'hicolor-icon-theme' 'glibc' 'gcc-libs' 'systemd-libs')
provides=('fcitx5-vmk')
conflicts=('fcitx5-vmk')
source=("https://github.com/nhktmdzhg/VMK/releases/download/v${pkgver}/fcitx5-vmk-v${pkgver}.tar.gz")
sha256sums=('c4df2af7c1eb73fd6f78dc074dbecd618172ceb2d2c12fbe607789d5e586d28e')
install='fcitx5-vmk.install'

package() {
    cd "$srcdir"
    cp -ra usr "$pkgdir/"
}
