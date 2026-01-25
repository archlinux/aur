# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=fcitx5-vmk-bin
pkgver=0.9.3alpha2
pkgrel=1
pkgdesc="VMK (Vietnamese Micro Key) for Fcitx5 - Bộ gõ tiếng Việt mô phỏng UniKey"
arch=('x86_64')
url="https://github.com/nhktmdzhg/VMK"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'libinput' 'hicolor-icon-theme' 'glibc' 'gcc-libs' 'systemd-libs')
provides=('fcitx5-vmk')
conflicts=('fcitx5-vmk')
source=('https://github.com/nhktmdzhg/VMK/releases/download/v0.9.3-alpha2/fcitx5-vmk-v0.9.3-alpha2.tar.gz')
sha256sums=('70c7e265495ae1cfa570720080fbe1ad59e0bb44237141bc26bff74c6671b843')
install='fcitx5-vmk.install'

package() {
    cd "$srcdir"
    cp -ra usr "$pkgdir/"
}
