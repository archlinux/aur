# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=201.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/201.0.0-beta001-roam_201.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/201.0.0-beta001-roam_201.0.0-beta001_arm64.deb")
sha256sums_x86_64=("5d6f115bbcd207edbfeb66cf8cd5cbaf877362ca990e539a4ef289274a21e902")
sha256sums_aarch64=("fd79dd6a1aa63f84897ff114d2f3d3588c089b3dca5be7a22e841daabef848c7")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
