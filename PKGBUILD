# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=107.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/107.1.0-beta001-roam_107.1.0-beta001_amd64.deb")
sha256sums=("23f8ffc834510728b7ae6bfc8d96fecfdbdfddcb05c6db294cd8d890775958b9")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
