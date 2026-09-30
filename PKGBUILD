# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=233.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/233.1.0-beta001-roam_233.1.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/233.1.0-beta001-roam_233.1.0-beta001_arm64.deb")
sha256sums_x86_64=("f1f38e0ded4f778e0bf8e6db2848cd91669230e6acfebeb4a5967e114052b846")
sha256sums_aarch64=("74ea8dc69a093e6daffaca75c28621790fbcf7ed64532f3b30df4eb033e16a1c")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
