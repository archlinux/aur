# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=227.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/227.0.0-beta001-roam_227.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/227.0.0-beta001-roam_227.0.0-beta001_arm64.deb")
sha256sums_x86_64=("b302fdba3c5c7d17c1a17900bb1cfb9b56ebedb4562b133045cb0679318aebab")
sha256sums_aarch64=("22a48a1ead45e0367e206b0eebe942e7c4f58fc9975612d9771a5aaec0959d09")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
