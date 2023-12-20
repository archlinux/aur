# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=88.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/88.0.0-beta001-roam_88.0.0-beta001_amd64.deb")
sha256sums=("9caaf5bdb70d393cf5035b1ed4313529d5c760829058e4c5f6bc75b8ebc503b5")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
