# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=200.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/200.0.0-beta001-roam_200.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/200.0.0-beta001-roam_200.0.0-beta001_arm64.deb")
sha256sums_x86_64=("3fd151ca4587648d0efceab35908f55a0b182e86f6b1ec53637310f48ebb44c9")
sha256sums_aarch64=("106e6a9509626bc2f5123c14a1297c279ca7949e80a39674f90ef4d01964eb52")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
