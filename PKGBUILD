# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=49.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/49.0.0-beta001-roam_49.0.0-beta001_amd64.deb")
sha256sums=("6441e2831d195f1c459bfdbf715ac364d1ed02a079667bd0fa2481388c81869a")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
