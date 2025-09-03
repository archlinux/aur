# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=177.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/177.0.0-beta001-roam_177.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/177.0.0-beta001-roam_177.0.0-beta001_arm64.deb")
sha256sums_x86_64=("ae0536fe0ebf15bd882e48503b9de69b6c8fa2b3d5176c2c32f98b20d9c270f3")
sha256sums_aarch64=("34141bec2cf00bcb4d0789ec2ea4e141d822316642006eee5d58d14e10e9e12e")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
