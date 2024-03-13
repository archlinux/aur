# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=100.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/100.1.0-beta001-roam_100.1.0-beta001_amd64.deb")
sha256sums=("e7d2bf294778b7e2e1f78800c2588c39805f030da224321e261a887c1afef75f")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
