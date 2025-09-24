# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=180.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/180.0.0-beta001-roam_180.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/180.0.0-beta001-roam_180.0.0-beta001_arm64.deb")
sha256sums_x86_64=("badaa37875f459853476a0b78e4bc4ef5adb636b8e96b9a4bb93de2452eda7b0")
sha256sums_aarch64=("2ab0fd9dba72a90832420b90ef1cefc2fbdeca20acbcfaa2bd12db47ac317da9")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
