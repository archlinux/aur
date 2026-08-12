# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=226.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/226.0.0-beta001-roam_226.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/226.0.0-beta001-roam_226.0.0-beta001_arm64.deb")
sha256sums_x86_64=("8fdaf94dcac067075f963697ad9ceae1fe7b16ff25c6fa98d2ff762f29da05ea")
sha256sums_aarch64=("9cf188b37d53258c69867ca7d01ee3c92f56a0ee1f105c6dc783d2b462923869")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
