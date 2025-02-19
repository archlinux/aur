# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=149.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/149.0.0-beta001-roam_149.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/149.0.0-beta001-roam_149.0.0-beta001_arm64.deb")
sha256sums_x86_64=("eb7c7eca1f3d1242799b98b2b60942890ac5cd7f1c5c8413ad265b3bb1e18a5f")
sha256sums_aarch64=("d2bb56e9243e7264cc2b8b6b106bd0ff0e93b242c02685a3b73b23e5b1e9961f")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
