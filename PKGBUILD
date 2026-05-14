# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=213.0.3.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/213.0.3-beta001-roam_213.0.3-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/213.0.3-beta001-roam_213.0.3-beta001_arm64.deb")
sha256sums_x86_64=("2c5da747ec77be3f53032e272871614db0ef07b7d15e885c1ec52641500f2266")
sha256sums_aarch64=("2ab45146fc96fe165dfba6760f442be3de049f96fe5b66693150d4a7b282f587")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
