# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=146.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/146.0.0-beta001-roam_146.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/146.0.0-beta001-roam_146.0.0-beta001_arm64.deb")
sha256sums_x86_64=("fdc85a7a265eddc33183b0cc3c623c7d285c79d331d87bfb55cbda82a34d7c17")
sha256sums_aarch64=("589840aebac3a42d598d96aed937f573c3c4b42574d1b6cc8de2007bb051b86c")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
