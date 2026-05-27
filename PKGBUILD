# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=215.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/215.0.0-beta001-roam_215.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/215.0.0-beta001-roam_215.0.0-beta001_arm64.deb")
sha256sums_x86_64=("1264fcc526d7428b51a024133ea2f3275a66b4ac2a90c22e44b9686f615c4584")
sha256sums_aarch64=("301513e88768b7b75c9490c595e2b5bc07415bd13c9341424797f592ddb90528")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
