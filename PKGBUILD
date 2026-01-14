# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=196.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/196.0.0-beta001-roam_196.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/196.0.0-beta001-roam_196.0.0-beta001_arm64.deb")
sha256sums_x86_64=("439166fc8d15dd83a49f3c5347b9867a991e26d99523e6c58d045ea08433ad20")
sha256sums_aarch64=("47127e1f73c66263edd62613e74f719f9a0959c58cb657c36bab4b82dd677591")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
