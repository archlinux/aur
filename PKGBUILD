# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=50.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/50.1.0-beta001-roam_50.1.0-beta001_amd64.deb")
sha256sums=("c2b69d3c56a7888d99f4b1d8424889bc93c589394197daf8c5e5c1547c9d4d7b")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
