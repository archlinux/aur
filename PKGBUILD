# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=vk-messenger-bin
pkgver=6.0.47.289
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
    'pipewire-pulse'
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
    'da4c6a78067410a80b23fbead4135ba99a153872f553fc70d4bc0d21406e7049'
)

package() {
    cp -a "${srcdir}/opt/"  "${pkgdir}/opt/"
    cp -a "${srcdir}/usr/"  "${pkgdir}/usr/"
}