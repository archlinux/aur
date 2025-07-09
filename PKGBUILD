# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=169.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/169.0.0-beta001-roam_169.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/169.0.0-beta001-roam_169.0.0-beta001_arm64.deb")
sha256sums_x86_64=("3a6d9f83f355b6d5a381ffa29f5f82fe5d917b408ff8c53b6a7250afc52e6069")
sha256sums_aarch64=("a7258f4bd66834bc6f4f7474ad95976f269c1556e56f2008a6e9950bdff5d99d")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
