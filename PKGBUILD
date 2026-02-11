# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=200.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/200.0.1-beta001-roam_200.0.1-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/200.0.1-beta001-roam_200.0.1-beta001_arm64.deb")
sha256sums_x86_64=("455b1342aac39b4d9cbfdbcaf38bdfe2ec45d9e564373495a4de24a9b6f8bdee")
sha256sums_aarch64=("e1edafaa0dbec5170d84a565fdd75827cb3961f1565e9a10458452284d7cc372")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
