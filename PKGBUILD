# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=75.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/75.1.0-beta001-roam_75.1.0-beta001_amd64.deb")
sha256sums=("fdab91a0918c618e9335d5271c279a66fd33c809acff5025ca0a8c370d8c355a")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
