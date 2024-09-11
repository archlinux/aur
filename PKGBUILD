# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=126.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/126.0.0-beta001-roam_126.0.0-beta001_amd64.deb")
sha256sums=("ca701df40a361b9a0cc97430453fab9fa1128d2d9c45dcff6221dd0354dc325b")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
