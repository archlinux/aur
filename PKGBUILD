# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=98.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/98.0.0-beta001-roam_98.0.0-beta001_amd64.deb")
sha256sums=("2cdcb14993ca39556d4d049c24f89dee20e0aaae3e86ec118cc6e42b81d8dc70")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
