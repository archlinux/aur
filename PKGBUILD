# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=57.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/57.0.0-beta001-roam_57.0.0-beta001_amd64.deb")
sha256sums=("ec56bb51590558d3ff66c8d350f585d9c1c3ab0c9fbb83e828b18aa373e3e29e")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
