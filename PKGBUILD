# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=129.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/129.0.1-beta001-roam_129.0.1-beta001_amd64.deb")
sha256sums=("6a828849bf4a443991e8cf925c6b4902b4cdd172bac8804a6605e5624db6cce7")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
