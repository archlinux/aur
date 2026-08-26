# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=228.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/228.0.0-beta001-roam_228.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/228.0.0-beta001-roam_228.0.0-beta001_arm64.deb")
sha256sums_x86_64=("19a8dbc6ed40de844cfb200376852fa068d004b324a7fed94fcb2f348e58f5b3")
sha256sums_aarch64=("75ad09b18d565f0316a1a4de2e08cd1febf4531edad4aa1498b5730ad3720927")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
