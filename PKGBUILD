# Maintainer: Funami
pkgname=asset-manager-studio
pkgver=1.1.0
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
sha256sums=('22cab1a1bbd7186b0ebf8a139e511d48293623b3d83eae937b4f181fb6ea804c')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/Asset Manager Studio/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
