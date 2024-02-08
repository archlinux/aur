# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=95.4.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/95.4.0-beta001-roam_95.4.0-beta001_amd64.deb")
sha256sums=("a3875b1ac97967ed9480107906a30b4608cefb5a9d7f72ed015f67e9da43fc49")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
