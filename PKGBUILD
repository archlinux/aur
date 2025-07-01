# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=168.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/168.0.0-beta001-roam_168.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/168.0.0-beta001-roam_168.0.0-beta001_arm64.deb")
sha256sums_x86_64=("0528ba61db83d1f75f7c7effb49dc554bb5841c12678882bc0cdafeefec10783")
sha256sums_aarch64=("d998e1c9a891da4584a8f5dce6dda8b6162601349915929ba9c6df7133727608")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
