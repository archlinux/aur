# Maintainer: Pandakewt <chuminhtuan30306@gmail.com>
# Contributor Games_Crack <aur@gamescrack.net>

pkgname=teleport-connect
pkgver=18.0.0
pkgrel=1
pkgdesc="Teleport Connect"
arch=('x86_64')
url="https://goteleport.com"
license=('Apache')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux' 'libsecret')
optdepends=('libappindicator-gtk3')
source=("${pkgname}-${pkgver}.deb::https://cdn.teleport.dev/teleport-connect_${pkgver}_amd64.deb")
sha256sums=('c5b8461b69e2129a345cc6e740e808e2a6cc23e21558ed8294528f42c4a22dd4')

package() {
    # Extract the DEB package
    bsdtar -Oxf "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.xz | bsdtar -xJf - -C "${pkgdir}"
}
