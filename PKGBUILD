# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=75.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/75.0.0-beta001-roam_75.0.0-beta001_amd64.deb")
sha256sums=("720c8d74e166cd313e3b377e1e666fa91e7bc637559d6e2cf72ab3079ccdc4f2")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
