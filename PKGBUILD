# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=114.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/114.0.0-beta001-roam_114.0.0-beta001_amd64.deb")
sha256sums=("e11fde2245479e4e6a5501415d81249f524a0d28e4b1bd61df4fcc6d3e97d021")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
