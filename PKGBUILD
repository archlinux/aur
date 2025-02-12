# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=148.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/148.0.0-beta001-roam_148.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/148.0.0-beta001-roam_148.0.0-beta001_arm64.deb")
sha256sums_x86_64=("6a22dce3d1ef5393337eb4a4690223f788176fec180e4859761932962583fc90")
sha256sums_aarch64=("abe3999b49a508b4b31e68b18ad86a2339c139a5bcf9b74bb3c3b724291bb579")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
