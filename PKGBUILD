# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=197.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/197.1.0-beta001-roam_197.1.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/197.1.0-beta001-roam_197.1.0-beta001_arm64.deb")
sha256sums_x86_64=("90f7f49d9073b86359b8ce43fbd67ad25364a8d327bcab20d0558789c719d235")
sha256sums_aarch64=("7b24c015422ffa28927c9b69923b3a22d7637532cdd722899e2e6a5c77780617")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
