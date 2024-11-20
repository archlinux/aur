# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=136.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/136.1.0-beta001-roam_136.1.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/136.1.0-beta001-roam_136.1.0-beta001_arm64.deb")
sha256sums_x86_64=("1a7553e1a87f59b441d075f2b9bd55813d2b7d5b2a7a9d6e7946c3e39ae66d91")
sha256sums_aarch64=("39e6f764362bcf67161dab4d46caf51572a513bc37e4f175ff86f06c6adf393a")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
