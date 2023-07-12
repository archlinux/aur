# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=65.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/65.0.0-beta001-roam_65.0.0-beta001_amd64.deb")
sha256sums=("76cb5db86dc081dde93d928f50017c8dbb995c1fe43745e6a7ff81ab187e4bef")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
