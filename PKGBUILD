# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=205.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/205.0.0-beta001-roam_205.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/205.0.0-beta001-roam_205.0.0-beta001_arm64.deb")
sha256sums_x86_64=("fb06585bc54b2f702fe279b26847da8d19039625ac25f9a79cc342b1f8059b27")
sha256sums_aarch64=("c8a3b5b9a3d3c5a782561d841033896ac12ee57337b6ee25882400827f83aca6")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
