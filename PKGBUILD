# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=87.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/87.0.0-beta001-roam_87.0.0-beta001_amd64.deb")
sha256sums=("3b1797932c16044c6e1bf7ad02e7e6ca3a750c6ed71e9154c384e5a55d425b6d")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
