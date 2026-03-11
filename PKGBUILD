# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=204.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/204.0.1-beta001-roam_204.0.1-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/204.0.1-beta001-roam_204.0.1-beta001_arm64.deb")
sha256sums_x86_64=("5c1a66bcc0b0bf6559659f2f85e711627a47ab663857d23745ec97ce270196af")
sha256sums_aarch64=("280098e8e0eb7dfefcb393d02d80f176ef722cde97a7502a9f480b22207cc4eb")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
