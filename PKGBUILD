# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=104.1.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/104.1.1-beta001-roam_104.1.1-beta001_amd64.deb")
sha256sums=("95523917d162bf4cecb73454702d0b210c7615c8e93b693ebb7e3a676f612df9")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
