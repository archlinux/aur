# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=50.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/50.0.0-beta001-roam_50.0.0-beta001_amd64.deb")
sha256sums=("eaf83f52a0f79297fec0ace50944fe2747ea06bc9dec6553a94b338f268b6f56")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
