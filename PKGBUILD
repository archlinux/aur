# Maintainer: Funami
pkgname=asset-manager-studio
pkgver=0.0.17
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
sha256sums=('e02399190e8dcfc162624ff160d88786276ed35f9532bb3fbf2d803f69d3e6e9')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/${pkgname}/${pkgname} "$pkgdir/usr/bin/${pkgname}"
}
