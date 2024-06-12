# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=113.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/113.0.0-beta001-roam_113.0.0-beta001_amd64.deb")
sha256sums=("cf2207f26dd3c92d9a62bf08a8f2b7d3c9c181921e43bdcdc6fecc2c6efe35df")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
