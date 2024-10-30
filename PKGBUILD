# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=133.1.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/133.1.1-beta001-roam_133.1.1-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/133.1.1-beta001-roam_133.1.1-beta001_arm64.deb")
sha256sums_x86_64=("4d96d5cd4d8601554fc3f286699b0ef52da8a0b8122f5b79bf28cf758a38b142")
sha256sums_aarch64=("fd39df3f7b7cc33079ef9365bd7de304ec399e42f8a42c78f450cd10842adbe5")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
