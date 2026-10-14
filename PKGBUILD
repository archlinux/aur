# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=235.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/235.0.0-beta001-roam_235.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/235.0.0-beta001-roam_235.0.0-beta001_arm64.deb")
sha256sums_x86_64=("b4055f1d797e511dfbb76acdb86c9da9f496aeb61e98791dadda1daf20498f9e")
sha256sums_aarch64=("2c2cb3afae3d5129becb56fe4599f1b49387e685695fdc775b1f42e9bdf8361c")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
