# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=140.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/140.1.0-beta001-roam_140.1.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/140.1.0-beta001-roam_140.1.0-beta001_arm64.deb")
sha256sums_x86_64=("b58b24f38438cc6eb140df938448384c708cc5293d874941b12a6f3950e05055")
sha256sums_aarch64=("4ae423b822096b79013cbf53daa6c3e9f0020ddc59d9925de73100b72bbc9c22")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
