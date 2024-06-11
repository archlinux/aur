# Maintainer: Vitaliy Volynskiy (i@vitalya.me)

pkgname=vk-messenger
pkgver=6.0.43
pkgrel=254
pkgdesc="VK Messenger for Linux"
arch=('x86_64')
url="https://vk.com/messenger"
license=('custom')
depends=('alsa-lib' 'expat' 'gtk3' 'libgcrypt' 'libgnome-keyring' 'libnotify' 'libxss' 'libxtst' 'nss' 'xdg-utils')
optdepends=('gnome-keyring')
source=("https://upload.object2.vk-apps.com/vk-me-desktop-dev-5837a06d-5f28-484a-ac22-045903cb1b1a/latest/vk-messenger.rpm")
sha256sums=('162cc8a5dffc0ad755665a70fe5316dbbefa28b43f170e8dfb114347256e7fe0')

prepare() {
    rm "${srcdir}/${pkgname}.rpm"
}

package() {
    mv "${srcdir}"/* "${pkgdir}"
}
