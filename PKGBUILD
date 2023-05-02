# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=55.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/55.0.0-beta001-roam_55.0.0-beta001_amd64.deb")
sha256sums=("5d5979078d4d71769581fcd6e0866f637dab786c9b5f468897c730f7f04d5993")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
