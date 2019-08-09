# Maintainer: basigur

pkgname=papirus-folders-nordic
pkgver=3.9
pkgrel=1
pkgdesc="Icons themes papirus color folder nordic"
arch=('any')
url="https://github.com/basigur/papirus-folders"
license=("LGPL3")
depends=('gtk-update-icon-cache' 'papirus-icon-theme')
source=("https://github.com/basigur/papirus-folders/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f0815a6d3358190e8688fe9abe90589d2af7e55f54051d8efffce2d20f8239c9')

package() {
  install -d "${pkgdir}/usr/share/icons"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  cp -r */ "$pkgdir/usr/share/icons/"
}

