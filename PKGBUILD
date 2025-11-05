# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=186.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/186.0.1-beta001-roam_186.0.1-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/186.0.1-beta001-roam_186.0.1-beta001_arm64.deb")
sha256sums_x86_64=("fb06874e895ea21c679ff5fd451fefd9bc8c583fbedd9f538b7e7280b9097352")
sha256sums_aarch64=("8d58a459beebb1754178a03e5f0da4b1fe4096a1c9cfcf3f1971811296d9e9db")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
