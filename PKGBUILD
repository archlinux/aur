# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=214.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/214.0.1-beta001-roam_214.0.1-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/214.0.1-beta001-roam_214.0.1-beta001_arm64.deb")
sha256sums_x86_64=("f3787f50ee824bddd1da4d9998333335309e94a732c7c94238988e00c1a4369e")
sha256sums_aarch64=("a897ca0ce144ae412b290cd2dc5b7bca8d1c0fd6eb1c82e4bc17cb8f40765630")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
