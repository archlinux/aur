# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=236.0.2.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/236.0.2-beta001-roam_236.0.2-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/236.0.2-beta001-roam_236.0.2-beta001_arm64.deb")
sha256sums_x86_64=("f216ce6ee1086041c93f869382c77f182d221f14b57e2e3b0424f546110251db")
sha256sums_aarch64=("08631f168e4b8371a6af92649ef466d38e5e9aece6f890f7f7720bff5401fd3d")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
