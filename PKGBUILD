# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=157.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/157.0.0-beta001-roam_157.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/157.0.0-beta001-roam_157.0.0-beta001_arm64.deb")
sha256sums_x86_64=("a189a777a64d613f8ecd9a3f3f9ec136df2e1ab8472570860a77e19769c9fd9d")
sha256sums_aarch64=("c0d1d1e76ea3a2e156d78f2d4eb733641ae3fd10224e8d38dd932f53d3523a2e")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
