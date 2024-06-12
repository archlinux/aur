# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=113.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/113.0.1-beta001-roam_113.0.1-beta001_amd64.deb")
sha256sums=("62e2e6bd7e41149ec3f98cf8439e3d765914430beaec3e33fdb7b25927dabc00")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
