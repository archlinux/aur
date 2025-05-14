# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=161.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/161.0.0-beta001-roam_161.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/161.0.0-beta001-roam_161.0.0-beta001_arm64.deb")
sha256sums_x86_64=("52726aeb43baa4c36ac1c5d79c60d9924cfb7d3116ac979e23bb1130fb5bdc27")
sha256sums_aarch64=("9f29fdc18cedef0adc251438afad36b2535798cf064ff3ac09435ea7d5773752")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
