# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=204.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/204.0.0-beta001-roam_204.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/204.0.0-beta001-roam_204.0.0-beta001_arm64.deb")
sha256sums_x86_64=("fca23513e7d0815e3e68cf689d51e00dec95477d4d8cdc9134c5a9f4fee75ec5")
sha256sums_aarch64=("527be6cfe519a9ab64d4ecd00058e5c0e236743f2137a2f5cda7da7015db9b68")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
