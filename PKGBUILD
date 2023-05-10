# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=57.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/57.1.0-beta001-roam_57.1.0-beta001_amd64.deb")
sha256sums=("3a152a0350878e4342fa8804bc6770948b13540ca953c2422173f10263447d6d")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
