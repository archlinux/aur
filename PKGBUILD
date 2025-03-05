# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=151.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/151.0.0-beta001-roam_151.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/151.0.0-beta001-roam_151.0.0-beta001_arm64.deb")
sha256sums_x86_64=("a306386d99e9254ec1794a69fac344b9545c22a89ff7dc5b5dc1b948de5e44bf")
sha256sums_aarch64=("68c9856a394fd32a8fc045f5aacf491b9975846e8a670b2a36d30ec7e99a7066")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
