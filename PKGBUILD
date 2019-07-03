# Maintainer: basigur

pkgname=papirus-folders-nordic
_pkgname=papirus-folders
pkgver=3.8
pkgrel=1
pkgdesc="Icons themes papirus color folder nordic."
arch=('any')
url="https://github.com/basigur/papirus-folders"
license=("LGPL3")
depends=('gtk-update-icon-cache' 'papirus-icon-theme')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/basigur/papirus-folders/archive/v$pkgver.tar.gz")

sha512sums=('ecab2bd520ef119c79cf66b5b05ed89d5a973566aa0d9a4efe7a7623439b66293773f1f9fa75f5ad8e6068a853bf27ae0a816cab041be6c510c55d3af54b71ec')

package() {
 cd "${_pkgname}-${pkgver}/${pkgname}"
  install -d "$pkgdir/usr/share/icons"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  cp -r ePap* Pap* "$pkgdir/usr/share/icons"
}

