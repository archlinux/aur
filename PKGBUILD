# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=176.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/176.0.0-beta001-roam_176.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/176.0.0-beta001-roam_176.0.0-beta001_arm64.deb")
sha256sums_x86_64=("a4843f2c0fc1b686768c3436702e7dd24c732ae8dd6fdc5d76ff9b8e63c2629a")
sha256sums_aarch64=("86e40c529753c232c1af20a95b9e5e9c693ce9eb5c5efcf7321329de4a0b19e2")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
