# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=48.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/48.0.0-beta001-roam_48.0.0-beta001_amd64.deb")
sha256sums=("197da0e4e9c3139b64a79c03aac069b4f9eec8c5d7366cbbd642f361f40f4b51")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
