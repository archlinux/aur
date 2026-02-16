# Maintainer: Funami
pkgname=asset-manager-studio
pkgver=1.0.1
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
sha256sums=('42fe6df969dfe475daee2d3561503f595caba59b06f660603f4e0e343c222ae3')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/Asset Manager Studio/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
