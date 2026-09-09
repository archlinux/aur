# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=230.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/230.0.0-beta001-roam_230.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/230.0.0-beta001-roam_230.0.0-beta001_arm64.deb")
sha256sums_x86_64=("d95c731458f5d5e3fb48e8766835e613147093da4aae95e9d1a2dde03bd01166")
sha256sums_aarch64=("fb3b3d74c115b95f1f8c9cfb5d238aee1b3f8c63d502529c034670b6ad11082f")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
