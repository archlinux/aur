# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=206.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/206.0.0-beta001-roam_206.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/206.0.0-beta001-roam_206.0.0-beta001_arm64.deb")
sha256sums_x86_64=("4bccd5a94db394b6cc6be1088e0ab7e4eed5d632898ba3fbbadb926ad53aac5e")
sha256sums_aarch64=("03c530e962e5f36b1e07dc01da562db364d0152827f04a0b872584b3905367ce")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
