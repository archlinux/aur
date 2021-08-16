# Maintainer: Konstantin Unruh <freaxmate@protonmail.com>
pkgname=libreoffice-style-yaru-fullcolor
_pkgver=2021-07-02
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A fullcolor icon pack for Libreoffice of the awesome Yaru theme."
arch=('any')
url="https://github.com/ubuntu/$pkgname"
license=('LGPL3')
depends=('libreoffice')
makedepends=()
source=("https://github.com/ubuntu/$pkgname/archive/refs/tags/$_pkgver.tar.gz")
sha512sums=('5cd1c05f8d99c1b53252565f57be9fcf359b06046ee10fa8932f6c5692cd0c8e656c5c03c2bbb590e7da9474444190634e56db0445180d0a279d83791669cdf6')

package() {
  cd "$pkgname-$_pkgver"
  ./install.sh
}

