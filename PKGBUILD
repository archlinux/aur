# Maintainer: Games_Crack aur@gamescrack.net
pkgname=teleport-connect
pkgver=14.3.3
pkgrel=1
pkgdesc="Teleport Connect"
arch=('x86_64')
url="https://goteleport.com"
license=('Apache')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux' 'libsecret')
optdepends=('libappindicator-gtk3')
source=("${pkgname}-${pkgver}.deb::https://cdn.teleport.dev/teleport-connect_${pkgver}_amd64.deb")
sha256sums=('48b4dea58b75c04c30e4712ad922486a392521e1d1ff2aa65585b3f9601a2a25')

package() {
    # Extract the DEB package
    bsdtar -Oxf "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.xz | bsdtar -xJf - -C "${pkgdir}"
}
