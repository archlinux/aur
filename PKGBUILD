# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=208.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/208.0.0-beta001-roam_208.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/208.0.0-beta001-roam_208.0.0-beta001_arm64.deb")
sha256sums_x86_64=("454b18471cd6760a5764bf386d855fc4235370797758c77de5abe4e5bd3babcd")
sha256sums_aarch64=("5536f0643993adbb99dd4cee9fe6a4986d37dbe09cc4c5cf5bbea7f68fb9910a")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
