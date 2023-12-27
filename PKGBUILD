# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=89.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/89.0.0-beta001-roam_89.0.0-beta001_amd64.deb")
sha256sums=("788dc33b03d2d40694f3581a8b8d755de13e9c0b34c2d27691da474228b10c0e")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
