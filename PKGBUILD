# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=192.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/192.0.0-beta001-roam_192.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/192.0.0-beta001-roam_192.0.0-beta001_arm64.deb")
sha256sums_x86_64=("9ba10bb3ad7c5898154132409906ce781f5e7f64c2ca57db6280b628b31c8936")
sha256sums_aarch64=("43ccce09f88df0a8525f86e337cb1eca9029eed8a34fa645c4eb90e24e7f99a8")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
