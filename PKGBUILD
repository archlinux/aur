# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=90.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/90.1.0-beta001-roam_90.1.0-beta001_amd64.deb")
sha256sums=("e97805318ce93d4fb7ab0d0b26d133530e9157b5e45f681180d94f1d41fbd946")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
