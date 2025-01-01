# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=142.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/142.0.0-beta001-roam_142.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/142.0.0-beta001-roam_142.0.0-beta001_arm64.deb")
sha256sums_x86_64=("ce0f792b5f65e72b5ac6db982527b4b9b88ccd7dd1cd65c299fd3f51cc9cb406")
sha256sums_aarch64=("2c0fb23a1e21090794e4fd1426f4e5a9f8a395006cafc20787ce9842a9f254e3")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
