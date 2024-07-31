# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=120.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/120.0.0-beta001-roam_120.0.0-beta001_amd64.deb")
sha256sums=("23259f17d333ddf45c6d702df7911ee870a230628004bac1d1c737f7440cd37b")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
