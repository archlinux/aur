# Maintainer: naetherm
pkgname=asset-manager-studio
pkgver=1.2.0
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
sha256sums=('d275ccd2fb1b33223218c686b6c43755b342a731d7d2338971f44e6e6fa05cdb')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/Asset Manager Studio/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
