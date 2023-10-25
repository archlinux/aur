# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=80.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/80.1.0-beta001-roam_80.1.0-beta001_amd64.deb")
sha256sums=("3a57c43d52180082f86e658991dd2f50a75d39dafc13dd103a3f02009d568191")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
