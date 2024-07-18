# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=118.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/118.0.1-beta001-roam_118.0.1-beta001_amd64.deb")
sha256sums=("10ed94755a3e93f2e5f0aca6035d7afc31215cd670a43e0bb2a47fbb6d10605c")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
