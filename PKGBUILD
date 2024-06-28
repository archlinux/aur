# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=115.1.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/115.1.1-beta001-roam_115.1.1-beta001_amd64.deb")
sha256sums=("f9a14183ed21a54286f2d641de6389aafc84beb602a65afbdef4ea75bc5a02ca")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
