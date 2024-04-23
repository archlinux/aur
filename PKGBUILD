# Maintainer: Funami
pkgname=asset-manager-studio
pkgver=0.0.25
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
sha256sums=('977e3347755c80fb740fd697bef763e502fd8cba5f2d06f233083901d6113e50')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/${pkgname}/${pkgname} "$pkgdir/usr/bin/${pkgname}"
}
