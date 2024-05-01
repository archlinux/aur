# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=107.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/107.0.0-beta001-roam_107.0.0-beta001_amd64.deb")
sha256sums=("f9d647fc30e88a694d9e01fde1094755833cad82044949bcc9f6c61c47958b94")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
