# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=236.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/236.0.0-beta001-roam_236.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/236.0.0-beta001-roam_236.0.0-beta001_arm64.deb")
sha256sums_x86_64=("76af999c22d849bfae902df2c395cd3cde724e6c3fefa71a075f838676a741d5")
sha256sums_aarch64=("3d39dd64fd091d81b25f0c1d1ee643207ff1614b4f152734c76c11c68c9a8813")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
