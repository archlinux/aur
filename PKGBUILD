# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=138.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/138.0.0-beta001-roam_138.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/138.0.0-beta001-roam_138.0.0-beta001_arm64.deb")
sha256sums_x86_64=("a7a5bb7b686e7c3636910d9412cfa107ed4599a28f0e40f51492d6400b692949")
sha256sums_aarch64=("a49e00571dc30d8da3bfce516e5f315314661d80ab03eb711b61dccdecec3773")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
