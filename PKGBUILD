# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=152.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/152.0.0-beta001-roam_152.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/152.0.0-beta001-roam_152.0.0-beta001_arm64.deb")
sha256sums_x86_64=("da875d92443fae109106b4ee432b2e263b9503a616ef2fb38d278704dc3c9dae")
sha256sums_aarch64=("113d591831637cc951b9d7fe032c61e2a27d99c61c0c408324349af876bd3ce0")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
