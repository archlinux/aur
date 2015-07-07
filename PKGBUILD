# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=faenza-crunchbang-icon-theme
pkgver=1.2
pkgrel=2
pkgdesc="Port of the Faenza icon theme for CrunchBang Waldorf."
arch=('any')
url="http://crunchbang.org/"
license=('GPL3')
depends=('faenza-icon-theme')
options=('emptydirs')
source=(http://dl.dropbox.com/u/69788808/aur/$pkgname-$pkgver.tar.gz)
sha1sums=('85c70c96a7546dda8bde9812ed4311293c6e1d58')

package() {
  cd "$srcdir"
  
  install -d "$pkgdir/usr/share/icons"
  cp -R Faenza-CrunchBang* "$pkgdir/usr/share/icons/"
}

# vim:set ts=2 sw=2 et:
