# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=179.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/179.0.0-beta001-roam_179.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/179.0.0-beta001-roam_179.0.0-beta001_arm64.deb")
sha256sums_x86_64=("29b758f694281626dc3335def227f61ed93cc6077357f8c315fb72dbd8809cdd")
sha256sums_aarch64=("fde70d645f692df819e97253f7ba5aff63ee29aec2452fbb83d95441e2cb099d")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
