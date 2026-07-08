# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=221.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/221.0.0-beta001-roam_221.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/221.0.0-beta001-roam_221.0.0-beta001_arm64.deb")
sha256sums_x86_64=("a6effbaedd513829c83932873374df8204ffcb64eb1d09a42db80c8567cae401")
sha256sums_aarch64=("24ad8caed01d185376dde4ce2cf5f4934aa6006de4a13bc23c5d9a7d0a7ce777")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
