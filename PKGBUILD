# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=232.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/232.0.0-beta001-roam_232.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/232.0.0-beta001-roam_232.0.0-beta001_arm64.deb")
sha256sums_x86_64=("26aee52ad844fd443ef715671b6fd8ca5b7d76e56169d36b5c96dc3f3b359dd9")
sha256sums_aarch64=("fe8b47a6a46b385516b85a627e2a42c0129aaae2c8c797e44f49c3ad53b485fc")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
