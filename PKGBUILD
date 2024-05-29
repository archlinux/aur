# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=111.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/111.0.0-beta001-roam_111.0.0-beta001_amd64.deb")
sha256sums=("e7dc1a7b6b1d93fdfa114fa85d3d188d677e29069db9249d6ee1d9d9838e43f8")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
