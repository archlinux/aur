# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=182.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/182.0.0-beta001-roam_182.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/182.0.0-beta001-roam_182.0.0-beta001_arm64.deb")
sha256sums_x86_64=("a66775448da0383bef4d05a5668e0b5850a4f2ee09097f553c36a5e9db4f11d9")
sha256sums_aarch64=("35093beb045a448d8597fb513c03ed65994ad8ebfd2df894dd9cbb2d26607830")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
