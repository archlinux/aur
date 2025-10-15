# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=183.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/183.0.0-beta001-roam_183.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/183.0.0-beta001-roam_183.0.0-beta001_arm64.deb")
sha256sums_x86_64=("2e9af309f18280ca6028eb2795102e49a43a10362dd6f8d07f11dab6029f3a9d")
sha256sums_aarch64=("2f82451d86c78538654706be19d4434fadccd9edff495c2dd970596cd8483de8")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
