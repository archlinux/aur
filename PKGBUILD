# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=83.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/83.1.0-beta001-roam_83.1.0-beta001_amd64.deb")
sha256sums=("10a95eb9ab7e765a67b82d8f1071f14d1ddd9b7a95ceed3e7e2edcd92ccb6a85")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
