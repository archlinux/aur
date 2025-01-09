# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=143.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/143.0.1-beta001-roam_143.0.1-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/143.0.1-beta001-roam_143.0.1-beta001_arm64.deb")
sha256sums_x86_64=("2145d29d3aef2e987080a48c382ddf2c59dad71e90b2fcc26c38050c2b414f28")
sha256sums_aarch64=("a41296b8656bc521f5c281f80c7230d72db3bcc003cb0c12480f5a45df29b01e")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
