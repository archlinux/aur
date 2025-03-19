# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=153.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/153.0.0-beta001-roam_153.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/153.0.0-beta001-roam_153.0.0-beta001_arm64.deb")
sha256sums_x86_64=("4d3d8369f6344f2e31f853aef748a4508177c458b6022bad62fb5357ad5a2ffe")
sha256sums_aarch64=("cb289e1d3a936f06d4dce2034e5462155f63362498bb3ace3538f3f44aaa8906")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
