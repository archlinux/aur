# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=124.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/124.0.0-beta001-roam_124.0.0-beta001_amd64.deb")
sha256sums=("9fd06850ce05faf2826781a983bc39a590194978df4a260fd4589bf7758e4b80")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
