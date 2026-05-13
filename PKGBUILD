# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=213.0.2.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/213.0.2-beta001-roam_213.0.2-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/213.0.2-beta001-roam_213.0.2-beta001_arm64.deb")
sha256sums_x86_64=("15b0533cb9ba18c40b31e795181a96f35dc53288b55beb00f885df035802b26d")
sha256sums_aarch64=("686326514b1fded1516e467d57045649011f714de5fd310712e5b2a6c12c6f72")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
