# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=203.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/203.1.0-beta001-roam_203.1.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/203.1.0-beta001-roam_203.1.0-beta001_arm64.deb")
sha256sums_x86_64=("3b1115f6a69b85e10b8b1ad0ae90d75f070ad251d2892efdc70495fe868e6290")
sha256sums_aarch64=("82817caf9d060f325b48fb17a2046b0b137f838ee6fd74b624b3635c6fd4a721")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
