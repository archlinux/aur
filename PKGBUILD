# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=228.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/228.0.1-beta001-roam_228.0.1-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/228.0.1-beta001-roam_228.0.1-beta001_arm64.deb")
sha256sums_x86_64=("47304701ecbbd3bf6eba6b6061c5ad3ade701ee65e3880aa1d8353277d2250a8")
sha256sums_aarch64=("61ec4951dfb1b0b4c88da60c0d233f4b61601cf7e08debfee37671328de010ab")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
