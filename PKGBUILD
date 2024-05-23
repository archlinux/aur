# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=110.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/110.1.0-beta001-roam_110.1.0-beta001_amd64.deb")
sha256sums=("ac87b68a6107361b1c3d52282dee46e8d7834fa3ef1162115963da7eac3ad5e5")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
