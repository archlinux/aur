# Maintainer: Funami
pkgname=asset-manager-studio
pkgver=0.0.29
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
sha256sums=('354fc34610673249c33ed5c3ca25a4aa2630797ff88926d4eefdb563dcc85dbe')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/${pkgname}/${pkgname} "$pkgdir/usr/bin/${pkgname}"
}
