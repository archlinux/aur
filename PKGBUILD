# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=134.2.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/134.2.0-beta001-roam_134.2.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/134.2.0-beta001-roam_134.2.0-beta001_arm64.deb")
sha256sums_x86_64=("43a65de6615570621b2da140cf65e4c5820569107d2641b743f15b67a5680711")
sha256sums_aarch64=("3f6a1d6d7ed7af54218562b8a26f0435a6a2a2e1e8e877f98fdef10c1c0f45ea")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
