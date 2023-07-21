# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=66.3.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/66.3.0-beta001-roam_66.3.0-beta001_amd64.deb")
sha256sums=("3923a6dcc28c467442277ac2d9afd6c6dc182941288c744d45e22175c81956ad")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
