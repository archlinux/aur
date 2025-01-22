# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=145.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/145.0.0-beta001-roam_145.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/145.0.0-beta001-roam_145.0.0-beta001_arm64.deb")
sha256sums_x86_64=("8425b8a7fb2c2fca6ad9671cb735b0b2ae8c31d170226877e82d34986aa8cf88")
sha256sums_aarch64=("35d978955268f52b71b2f815ba734cabab2fee2517e1acc03a93967b70ef4bf9")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
