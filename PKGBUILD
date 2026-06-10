# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=217.0.2.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/217.0.2-beta001-roam_217.0.2-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/217.0.2-beta001-roam_217.0.2-beta001_arm64.deb")
sha256sums_x86_64=("3ca6131725b2ed69c2c72bb999fab32c557f9a8f912276d7741e0fd11a7cdcc0")
sha256sums_aarch64=("dc0b6425079ac3f75d9b156d8e600e600d4bc653e20b02d6a5a2ca4432223835")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
