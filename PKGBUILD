# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=102.2.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/102.2.1-beta001-roam_102.2.1-beta001_amd64.deb")
sha256sums=("79e2f3d6e431c0f7a7a575198ee8b3c37ddeea21ee70384fecee796cd20af56f")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
