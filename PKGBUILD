# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=178.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/178.0.0-beta001-roam_178.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/178.0.0-beta001-roam_178.0.0-beta001_arm64.deb")
sha256sums_x86_64=("ec24be045cd78b8102bd141d304c8818e3adbad974f2a6dea775f9a4246bb9f7")
sha256sums_aarch64=("dfff0667a8af0ff7ba5c702e509b78ca0d87a054f6352d5acb69c668fc6b4009")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
