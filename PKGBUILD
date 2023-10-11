# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=78.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/78.0.0-beta001-roam_78.0.0-beta001_amd64.deb")
sha256sums=("74e267e784ceb2914ed57757c172a3b3c4d89ac2674eaaad4b5ea24d30a6e8fd")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
