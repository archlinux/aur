# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=123.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/123.0.0-beta001-roam_123.0.0-beta001_amd64.deb")
sha256sums=("83eded742baa4a264456e7ac3a0ec1c6a7069f5cde68c2c8795d8a2df51fb643")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
