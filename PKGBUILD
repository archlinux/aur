# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=237.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/237.0.0-beta001-roam_237.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/237.0.0-beta001-roam_237.0.0-beta001_arm64.deb")
sha256sums_x86_64=("34140dd8a25a5d16807011ec20b6a1a160e9062dc1d8d500941a7677ce718935")
sha256sums_aarch64=("4035d07556fecd99e4e2c78a459441d72c829e31f4e303f6cd058d8ab0081887")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
