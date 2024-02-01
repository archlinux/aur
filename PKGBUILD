# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=94.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/94.0.0-beta001-roam_94.0.0-beta001_amd64.deb")
sha256sums=("d4c6a1466089380943e26f0ffca3b6ea47e7f8563e5916de95a5cc378fcb04b8")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
