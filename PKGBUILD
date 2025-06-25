# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=167.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/167.0.0-beta001-roam_167.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/167.0.0-beta001-roam_167.0.0-beta001_arm64.deb")
sha256sums_x86_64=("9ef87b054b71ad8c9f0892695b5eda4bd79614c716fac7a6c56611b5d128a9da")
sha256sums_aarch64=("e1e80f98f0adf058a1730396c6b7217b7c5fd9866944e847d21d9997e98c6108")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
