# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=212.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/212.0.0-beta001-roam_212.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/212.0.0-beta001-roam_212.0.0-beta001_arm64.deb")
sha256sums_x86_64=("1ad9ce3d441949abb849e10b82fcb452a3ec010b8c09b296d99a7abe2b133c3a")
sha256sums_aarch64=("0df48c0a7cdab7c30768cb7b9a8d50c763a79090cde40e06fef7524819cb4c70")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
