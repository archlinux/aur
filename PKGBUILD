# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=82.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/82.1.0-beta001-roam_82.1.0-beta001_amd64.deb")
sha256sums=("730edf5328fa456765cc36d0a44e5876e78f34f983d7481ffd5602fc2b3d3ceb")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
