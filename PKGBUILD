# Maintainer: Funami
pkgname=asset-manager-studio
pkgver=0.0.30
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
sha256sums=('37825bdec8fb950692e65d23df9632e25e48a8b3b0da29425c994a9334a4d9d0')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/${pkgname}/${pkgname} "$pkgdir/usr/bin/${pkgname}"
}
