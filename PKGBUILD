# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=131.1.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/131.1.1-beta001-roam_131.1.1-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/131.1.1-beta001-roam_131.1.1-beta001_arm64.deb")
sha256sums_x86_64=("c5b47d99cafcbe2c6c207a57ba1ff1d020196cc2a5d96191c34053b2beb9ff1a")
sha256sums_aarch64=("06ebe55a753699cc415518d4ae90292b7a033a219fd047438dfd5515b16fe925")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
