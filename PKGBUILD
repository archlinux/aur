# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=172.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/172.0.0-beta001-roam_172.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/172.0.0-beta001-roam_172.0.0-beta001_arm64.deb")
sha256sums_x86_64=("4d505e3c26ba35e31abb19b85f74ce0759df1e34d60ab8774a436b20d20ba54d")
sha256sums_aarch64=("8d5a6805db88302feb47300732ef76be9213adec4908d22a8edff93b82b3eb8e")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
