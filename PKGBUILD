# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=191.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/191.0.0-beta001-roam_191.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/191.0.0-beta001-roam_191.0.0-beta001_arm64.deb")
sha256sums_x86_64=("92823eb1a02771261168039b501d68f6099b4cc63e632159319cf47689a223eb")
sha256sums_aarch64=("9e7a74fcf18ac8fbfbec7456d44497a63f721a3fe90025727f0da708198d7a96")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
