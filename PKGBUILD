# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=231.0.3.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/231.0.3-beta001-roam_231.0.3-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/231.0.3-beta001-roam_231.0.3-beta001_arm64.deb")
sha256sums_x86_64=("a091b18ccc2facd124273a1b75a55af078a908626bc99e11c6c2598ab7eae5cc")
sha256sums_aarch64=("da45924d8ce2533f991ff1d3f258e664cbf79f4f559ec28d775da03116ec5d21")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
