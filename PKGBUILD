# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=vk-messenger-bin
pkgver=6.0.43.254
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
    'pulseaudio'
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
    '162cc8a5dffc0ad755665a70fe5316dbbefa28b43f170e8dfb114347256e7fe0'
)

package() {
    cp -a "${srcdir}/opt/"  "${pkgdir}/opt/"
    cp -a "${srcdir}/usr/"  "${pkgdir}/usr/"
}