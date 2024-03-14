# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=100.1.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/100.1.1-beta001-roam_100.1.1-beta001_amd64.deb")
sha256sums=("dc428f227659691330ebafad7381d781859147e70fce6c3fdedcba278e72d748")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
