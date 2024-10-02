# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=129.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/129.0.0-beta001-roam_129.0.0-beta001_amd64.deb")
sha256sums=("60d2e7567aa4ed9f13e33050506d0035e614cb1ae6e1123d0b3a87ee09d0fe4f")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
