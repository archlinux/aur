# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=202.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/202.0.0-beta001-roam_202.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/202.0.0-beta001-roam_202.0.0-beta001_arm64.deb")
sha256sums_x86_64=("555df1ab053aba122418334d734bd2136f885a1e25cff47a458419fab4d9bcab")
sha256sums_aarch64=("4b6fe89484671c4d2e6e40784e92bfe0b0750e0e1800d6b892af43e676065e71")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
