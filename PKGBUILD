# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=160.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/160.0.0-beta001-roam_160.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/160.0.0-beta001-roam_160.0.0-beta001_arm64.deb")
sha256sums_x86_64=("a2e8166fc346a587f28b7ddbae7ac3d0849188f927e1dc6b75d6dcd9640d5d2c")
sha256sums_aarch64=("65daa3cb9d9af77f3fdd27268c067325a3cfe7fbc63e453d7dc71f7fc3cb9262")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
