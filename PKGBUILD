# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=122.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/122.0.1-beta001-roam_122.0.1-beta001_amd64.deb")
sha256sums=("4389a8ecdf2d5d06ce12c99790603e777caf8f882fb01bd38e56e9a125653079")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
