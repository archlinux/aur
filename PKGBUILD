# Maintainer: Funami
pkgname=asset-manager-studio
pkgver=1.1.1
pkgrel=1
pkgdesc="Asset Manager Studio"
arch=('x86_64')
url="https://assetmanager.studio/"
license=('APACHE')
depends=()
optdepends=()
provides=('asset-manager-studio')
conflicts=('asset-manager-studio')
source=("https://assetmanager.studio/dl/${pkgver}/asset-manager-studio_${pkgver}_amd64.deb")
sha256sums=('cf9831ae8590b1f0acb0d3ad12ecaf1e9611ea73a6800b5874acb56f81390cee')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/Asset Manager Studio/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
