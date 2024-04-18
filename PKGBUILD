# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=105.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/105.0.1-beta001-roam_105.0.1-beta001_amd64.deb")
sha256sums=("8f68993520be950a01a38925a4ebb7797d710c1465f43a1c3633bbe1c8745cb7")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
