# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=143.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/143.0.0-beta001-roam_143.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/143.0.0-beta001-roam_143.0.0-beta001_arm64.deb")
sha256sums_x86_64=("e00c722e9e25d8ff692cb6b8fe7afc9d947b1734485f695267a7d55390b81a5c")
sha256sums_aarch64=("bfb14b079edb5f1b0d82a1888df2ab1f1cf9258266284ac3b61ae1b687eca14e")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
