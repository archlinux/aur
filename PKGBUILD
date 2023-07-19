# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=66.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/66.1.0-beta001-roam_66.1.0-beta001_amd64.deb")
sha256sums=("88e054ec8b9332da17e77ce7a837cef0aa8fa9593a9fef6c16be947bbc6bf790")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
