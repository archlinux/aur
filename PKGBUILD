# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=165.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/165.0.0-beta001-roam_165.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/165.0.0-beta001-roam_165.0.0-beta001_arm64.deb")
sha256sums_x86_64=("ac9b17ecc0668c6bf9414459962c57985409bc9c073df005555e249ba5d50b36")
sha256sums_aarch64=("ce03f700d6e16d8eb490460209737f5acbd9a1eebda4da0140a73ca8b114bd23")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
