# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=136.3.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/136.3.0-beta001-roam_136.3.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/136.3.0-beta001-roam_136.3.0-beta001_arm64.deb")
sha256sums_x86_64=("3df3b5d40fd0eef8d20dd6d8c3c80196b7af9ccf9624c1b1193558488b888a42")
sha256sums_aarch64=("a816031ba9172423a34eb9ef6141b2b6a73342c1c9b87745ffcaec425dc46d6f")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
