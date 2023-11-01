# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=81.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/81.0.0-beta001-roam_81.0.0-beta001_amd64.deb")
sha256sums=("a30c3780b9121b25177105f773a4caefdee584a3cae43442ba9f4b9c2bb38c4c")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
