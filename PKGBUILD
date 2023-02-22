# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=46.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/46.0.0-beta001-roam_46.0.0-beta001_amd64.deb")
sha256sums=("0d55d612083fec8d1a0d8d84444a0e89b49a75d19dacdc11e27521d1378fc10c")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
