# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=110.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/110.0.0-beta001-roam_110.0.0-beta001_amd64.deb")
sha256sums=("9e6f2cd89181f34db743477892c269cc63f6557f28281a3a1d6530a323287ea5")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
