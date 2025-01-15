# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=vk-messenger-bin
pkgver=6.0.51.318
pkgrel=1
pkgdesc="VK Messenger for Linux from rpm package"
arch=('x86_64')
url="https://vk.me/app"
license=('ISC')
replaces=(
    'vk-messenger'
    'vk-messenger-appimage'
)
depends=(
    'pulse-native-provider'
)
optdepends=(
    'libappindicator-gtk3'
)
options=(!strip)

_app_name="vk-messenger"
_app_bin_name=${_app_name}".rpm"

source=(
    https://upload.object2.vk-apps.com/vk-me-desktop-dev-5837a06d-5f28-484a-ac22-045903cb1b1a/latest/${_app_bin_name}
)
sha256sums=(
    'f0b5e23ae55ab2be016b184f18bda3e8c5f5d83d385c477c13705127d7715d9a'
)

package() {
    cp -a "${srcdir}/opt/"  "${pkgdir}/opt/"
    cp -a "${srcdir}/usr/"  "${pkgdir}/usr/"
}
