# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=103.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/103.0.0-beta001-roam_103.0.0-beta001_amd64.deb")
sha256sums=("1088330d0f3002873d6825570e786d7fcf05eaeb056c1654915a5766d8862492")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
