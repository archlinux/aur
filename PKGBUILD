# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=130.0.4.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/130.0.4-beta001-roam_130.0.4-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/130.0.4-beta001-roam_130.0.4-beta001_arm64.deb")
sha256sums_x86_64=("32d4c26e9d6d7881db324d172aed7e5671b2464715958c928645243a645851fd")
sha256sums_aarch64=("4c06923a11ebd0791dd35f422044992e77e467343f4d8d12d788717204af46c9")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
