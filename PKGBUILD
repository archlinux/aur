# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=229.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/229.0.0-beta001-roam_229.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/229.0.0-beta001-roam_229.0.0-beta001_arm64.deb")
sha256sums_x86_64=("d81f6d252f22fdc0bffcc4652eba49dff3cad832f0833bfedef0d5e54eea3864")
sha256sums_aarch64=("cbbd7b91f4f0d368d0c37874b1527e05dd7026dba95a9caffadf897407c44311")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}
