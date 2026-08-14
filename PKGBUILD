# Maintainer: naetherm
pkgname=asset-manager-studio
pkgver=1.2.2
pkgrel=1
pkgdesc="Project, Engine, Asset management for Epic UnrealEngine.  Manage, Download, install assets from Fab, Quixel, Cosmos to Unreal Engine"
arch=('x86_64')
url="https://assetmanager.studio/"
license=('APACHE')
depends=()
optdepends=()
provides=('asset-manager-studio')
conflicts=('asset-manager-studio')
source=("https://assetmanager.studio/dl/${pkgver}/asset-manager-studio_${pkgver}_amd64.deb")
sha256sums=('5b63ad309c79839db79ee2c10af558ade6ae3e92633b247857d24f00ce39612c')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/Asset Manager Studio/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
