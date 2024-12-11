# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=139.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/139.0.0-beta001-roam_139.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/139.0.0-beta001-roam_139.0.0-beta001_arm64.deb")
sha256sums_x86_64=("24bb9575ad504a94fad0fbb8e77aa891d313b6fb5a6d3b586fb35b57c260b160")
sha256sums_aarch64=("22bed11e8acae9904207ab182bc56e75acad37a75e2342dfec8b0ac6133ad5d9")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
