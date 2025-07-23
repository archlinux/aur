# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=171.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/171.0.0-beta001-roam_171.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/171.0.0-beta001-roam_171.0.0-beta001_arm64.deb")
sha256sums_x86_64=("599e2035fe58c396d0b0073087c79cf4a20555b2b592551e2d1f157fbd5840b8")
sha256sums_aarch64=("c5328a7dafd38d71ac1dc7869cb549eb4e9df36f714fb4834389ccb6066458ff")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
