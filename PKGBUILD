# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=147.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/147.0.0-beta001-roam_147.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/147.0.0-beta001-roam_147.0.0-beta001_arm64.deb")
sha256sums_x86_64=("27cb2523356823d60eeb5dd85bc7300b9a24106c1af5cb073b4e2a13bf4b3558")
sha256sums_aarch64=("64093fae36186a34729950b97895ffd9ded9b6d0b7b94c351502c56caa7d9f35")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
