# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=158.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/158.0.0-beta001-roam_158.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/158.0.0-beta001-roam_158.0.0-beta001_arm64.deb")
sha256sums_x86_64=("6b3ed3576a8a857b51d09097893bde0bddc10d6a2974dbc3c52df78f8688854a")
sha256sums_aarch64=("7b9b65ab0309ec7c7f0cc1ec79e00ca2a252e90b9590504de88ed69c6a93ec26")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
