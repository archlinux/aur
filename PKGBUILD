# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=241.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/241.0.0-beta001-roam_241.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/241.0.0-beta001-roam_241.0.0-beta001_arm64.deb")
sha256sums_x86_64=("2a8c2d7028b92a2173d3e8a01adf1a483f13024d2abc382655807c32ce709db2")
sha256sums_aarch64=("6e3390328f97ac7d88e49520db97db3511d23697a261ddd90df44f9f8015cf5c")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
