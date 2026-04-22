# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=210.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/210.0.1-beta001-roam_210.0.1-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/210.0.1-beta001-roam_210.0.1-beta001_arm64.deb")
sha256sums_x86_64=("2b7ba0fbfe4c5118b9a8bcf4b8587e051c184ef429f2f3454b0c4b85bbfdcb1c")
sha256sums_aarch64=("fc892addb14b0cdb512b827b012916a6bd32bb43f52106ac6279f5ccd5f9a235")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
