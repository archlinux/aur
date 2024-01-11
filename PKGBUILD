# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=91.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/91.1.0-beta001-roam_91.1.0-beta001_amd64.deb")
sha256sums=("8484cb3d1fcc090494ab0347449be9ef31968f18b47138a39e536b7c23026af6")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
