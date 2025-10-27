# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=184.0.3.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/184.0.3-beta001-roam_184.0.3-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/184.0.3-beta001-roam_184.0.3-beta001_arm64.deb")
sha256sums_x86_64=("a400bc79e13fa99fbe47da0144c7d6038fc65071a396c76f98f918dfc0a5eed6")
sha256sums_aarch64=("d9009f929a93434454750cf205656ccf80b8337381b3537da17ceb7884562654")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
