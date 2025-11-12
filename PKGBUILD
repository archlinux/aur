# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=187.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/187.0.0-beta001-roam_187.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/187.0.0-beta001-roam_187.0.0-beta001_arm64.deb")
sha256sums_x86_64=("56ecb7baff14cb8a7f6a31c11840f4afc937b0d6fc0760601529ebbf053bb97b")
sha256sums_aarch64=("a8951f413c0a32bba5e92aadbb0fdcf37e946a0f211d098bcdd651a297705eb7")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
