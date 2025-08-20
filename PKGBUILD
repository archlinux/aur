# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=175.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/175.1.0-beta001-roam_175.1.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/175.1.0-beta001-roam_175.1.0-beta001_arm64.deb")
sha256sums_x86_64=("4658f9c8fb6d75b4344c28ff29f7fa66f04c0e7c1daffbb2474becd8f8ed75e3")
sha256sums_aarch64=("cc6c5c4d1305fc8558059974db41eae90c04a75e30c9e94dae7bd097d9c3d8b6")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
