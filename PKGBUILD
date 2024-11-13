# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=135.2.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/135.2.0-beta001-roam_135.2.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/135.2.0-beta001-roam_135.2.0-beta001_arm64.deb")
sha256sums_x86_64=("f89f4e598cf656b33c3f573c94e1391a7332a1631c376ecaa5d901922cb8fb51")
sha256sums_aarch64=("398d47f11ee06d009d188bb09727e9b619c0488ade70b29d29ccd4fdd7dbedce")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
