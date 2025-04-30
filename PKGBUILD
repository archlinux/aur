# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=159.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/159.0.0-beta001-roam_159.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/159.0.0-beta001-roam_159.0.0-beta001_arm64.deb")
sha256sums_x86_64=("6d8a28d0d022c3e0a4e8cb33f5c95b40bc87b183b0095c4aadb6598f0c5de92f")
sha256sums_aarch64=("9b9d193255b43d45765d75a06e74fd7509b37b9a89aba284fbfaff0a8d096f9d")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
