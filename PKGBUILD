# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=190.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/190.0.0-beta001-roam_190.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/190.0.0-beta001-roam_190.0.0-beta001_arm64.deb")
sha256sums_x86_64=("b87a5929203d32e003e39ab14e78102cabb05671cfb8b9811ccc455fc8ab121b")
sha256sums_aarch64=("2c4135e6eedb8dc9c8db9f01656135416a9a43908a2288b1f75afe04d937572e")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
