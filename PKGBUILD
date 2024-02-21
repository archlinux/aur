# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=97.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/97.0.0-beta001-roam_97.0.0-beta001_amd64.deb")
sha256sums=("7ad93ca8bb0cb349481f1e26f658ad83bff7e8be71d6ce6f82a22594a513306f")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
