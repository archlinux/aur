# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=220.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/220.0.0-beta001-roam_220.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/220.0.0-beta001-roam_220.0.0-beta001_arm64.deb")
sha256sums_x86_64=("cdfa0aa8da6b053e5cfa80f4d72cc9c508f543c129d1cb63945d6eb3c4546650")
sha256sums_aarch64=("75c61cc1d3b9a1447d47c299602706d83d81b49b137c36893e7680993ede8b52")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
