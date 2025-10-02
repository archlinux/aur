# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=181.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/181.0.1-beta001-roam_181.0.1-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/181.0.1-beta001-roam_181.0.1-beta001_arm64.deb")
sha256sums_x86_64=("37ae0bdc49a6a3068941c0a670e2c3dc2e6cc3d87fa8e68fbf560a165f230412")
sha256sums_aarch64=("0c687510e068304ecc67e05510b02376a3139611ec506e65a4142f59c7723630")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
