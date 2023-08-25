# Maintainer: Funami
pkgname=asset-manager-studio
pkgver=0.0.18
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
sha256sums=('fc0db5ca3ede850f3990afd44a9e04603d067533131100dca8fcddc8e5d5a925')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/${pkgname}/${pkgname} "$pkgdir/usr/bin/${pkgname}"
}
