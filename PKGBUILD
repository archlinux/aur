# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=175.1.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/175.1.1-beta001-roam_175.1.1-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/175.1.1-beta001-roam_175.1.1-beta001_arm64.deb")
sha256sums_x86_64=("92a6ae90de38e0cc35271fce77397fdffd7ede8eea807043c426b854f52fa031")
sha256sums_aarch64=("8a9d2a74c64ba0cc3654a323033fc1076d7c6b6b2d649952d7893e3559739bc4")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
