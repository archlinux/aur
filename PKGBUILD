# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=70.2.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/70.2.0-beta001-roam_70.2.0-beta001_amd64.deb")
sha256sums=("9ab381f8c04eefae1d646a0551709fa54bdd7f7d49542c30c0b564b185eb469b")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
