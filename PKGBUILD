# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=130.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/130.0.0-beta001-roam_130.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/130.0.0-beta001-roam_130.0.0-beta001_arm64.deb")
sha256sums_x86_64=("3e426943c16847f0864f0d11040a1f8bea35cea010db89040363be581a3a239d")
sha256sums_aarch64=("add932b7ecc21d33eb28118a32e255038ce37654c29d624e510c72172014d39d")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
