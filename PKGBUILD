# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=219.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/219.0.0-beta001-roam_219.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/219.0.0-beta001-roam_219.0.0-beta001_arm64.deb")
sha256sums_x86_64=("b034bf63e9177d934131820cd99e68b29b4723e308d1bc904f62b6807e12676f")
sha256sums_aarch64=("1bad7357a6e44f11785585a9baa215c008bad4c1d14eb46d3a411c4dc25de16f")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
