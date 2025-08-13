# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=174.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/174.0.0-beta001-roam_174.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/174.0.0-beta001-roam_174.0.0-beta001_arm64.deb")
sha256sums_x86_64=("a2ae8a7ad6b8000d8021d55009570e2bbb4d4c343c3ba30d99c0b9ff6b6d5b86")
sha256sums_aarch64=("109a0ccee71b709dd021cdca7c9fe064c639d91512f9439ba364d5d6e56233cb")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
