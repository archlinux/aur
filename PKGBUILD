# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=62.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/62.1.0-beta001-roam_62.1.0-beta001_amd64.deb")
sha256sums=("e90408a8f8096b2ae97fb3979dfb1870c5c3f2a96ba6162378adcb6f11055319")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
