# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=133.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/133.1.0-beta001-roam_133.1.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/133.1.0-beta001-roam_133.1.0-beta001_arm64.deb")
sha256sums_x86_64=("1c13959a2f1ca965811b3b08529698e7efb8d3165fef6536dc895dc6ce1cf1d9")
sha256sums_aarch64=("493ea6a62d1dbacdc5c8d08c2e0eee38ebb0c90014f887033977ab46dff771fc")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
