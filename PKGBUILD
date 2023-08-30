# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=72.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/72.0.0-beta001-roam_72.0.0-beta001_amd64.deb")
sha256sums=("e7a3f65b41aac5b418dcc4535aafcd775da7ad87ad71da0bcec014270ea7a6b7")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
