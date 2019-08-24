# Maintainer: basigur

pkgname=papirus-folders-nordic
pkgver=4.0
pkgrel=1
pkgdesc="Icons themes papirus color folder nordic"
arch=('any')
url="https://github.com/basigur/papirus-folders"
license=("LGPL3")
depends=('gtk-update-icon-cache' 'papirus-icon-theme')
source=("https://github.com/basigur/papirus-folders/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7c0d2dca3cc96f644ca197318f7ad4af37c33a79d407d2a64c7ef262f679d525')

package() {
  install -d "${pkgdir}/usr/share/icons"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  cp -r */ "$pkgdir/usr/share/icons/"
}

