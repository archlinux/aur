# Maintainer: Games_Crack aur@gamescrack.net
pkgname=teleport-connect
pkgver=15.0.2
pkgrel=1
pkgdesc="Teleport Connect"
arch=('x86_64')
url="https://goteleport.com"
license=('Apache')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux' 'libsecret')
optdepends=('libappindicator-gtk3')
source=("${pkgname}-${pkgver}.deb::https://cdn.teleport.dev/teleport-connect_${pkgver}_amd64.deb")
sha256sums=('65bb335f401410608c53bd78e024edc2a029988750a0d79afd1c83f2b4ea612c')

package() {
    # Extract the DEB package
    bsdtar -Oxf "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.xz | bsdtar -xJf - -C "${pkgdir}"
}
