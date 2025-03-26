# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=154.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/154.0.0-beta001-roam_154.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/154.0.0-beta001-roam_154.0.0-beta001_arm64.deb")
sha256sums_x86_64=("9c2a1b9680c38fda94520c3989d45697867e3901b261cc71da190b43325f04ab")
sha256sums_aarch64=("a071b830f36d2d7723e0feca8d5ae981ff9625d5d7ee92c8ba8ba2588e883182")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
