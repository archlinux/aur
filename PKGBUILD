# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Author: Patrick Brisbin <pbrisbin@gmail.com>
pkgname=aurget
pkgver=4.7.8
pkgrel=1
pkgdesc="A simple, Pacman-like AUR helper"
arch=('any')
url="https://github.com/pbrisbin/$pkgname"
license=('GPL')
source=("https://github.com/pbrisbin/$pkgname/releases/download/v${pkgver//_/-}/aurget-${pkgver//_/-}.tar.gz")
optdepends=('customizepkg: for auto-customizing packages')

package() {
  cd "$pkgname-${pkgver//_/-}" || exit 1

  make PREFIX=/usr DESTDIR="$pkgdir" install
}
md5sums=('113f3ee9b9946bc46aa733e4236fc6c7')
