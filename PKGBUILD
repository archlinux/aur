# Maintainer: Eric Cheng <eric 'at' chengeric 'fullstop' com>

pkgname=earth-view-wallpaper-gnome-extension
pkgver=10
pkgrel=2
pkgdesc="A beautiful satellite image from Google Earth as your GNOME desktop wallpaper."
arch=('any')
url="https://github.com/neffo/${pkgname}"
license=('GPL-3')
depends=('gnome-shell>=3.18')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('cb47c8c56b1215d4bc0be2257858e83b')

package() {
  tar -xzf "$pkgname-$pkgver"

  mv "$pkgname-$pkgver" "$pkgdir/usr/share/gnome-shell/extensions"
}
