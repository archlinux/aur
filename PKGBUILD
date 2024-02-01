# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=94.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/94.1.0-beta001-roam_94.1.0-beta001_amd64.deb")
sha256sums=("57c6fe3c60c77373a8340b6ca6fcae82535a05e99614232e3784107a21b8861e")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
