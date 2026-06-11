# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=217.0.5.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/217.0.5-beta001-roam_217.0.5-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/217.0.5-beta001-roam_217.0.5-beta001_arm64.deb")
sha256sums_x86_64=("ab543b3522c67329a5c9754eebde54a37ac3c715aff36a89b0e219a09c57e8ff")
sha256sums_aarch64=("4428bb8d5e2fc104c6f1cb664f2186b2e514d3c819fa21ac2d827dd8d4a24f06")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
