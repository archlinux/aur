# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=223.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/223.0.0-beta001-roam_223.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/223.0.0-beta001-roam_223.0.0-beta001_arm64.deb")
sha256sums_x86_64=("502ce864de47b3fbf992528c422c30316d1677dffb3288cadb28e6d8f3d8a6bc")
sha256sums_aarch64=("2fa04d2c17e7a0ff049d6d22f2fb8111ae5fadd04f7e0606af2a7a85cb90d017")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
