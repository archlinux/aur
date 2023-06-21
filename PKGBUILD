# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=62.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/62.0.0-beta001-roam_62.0.0-beta001_amd64.deb")
sha256sums=("4f627936e5d865b1bee78455363ebba85b285ddc288234ccf4f23fa5252f8974")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
