# Contributor: Alexandr Parkhomenko <it@52tour.ru>

pkgname=unamea
pkgver=1.0.0
pkgrel=1
pkgdesc="Print all certain system information."
arch=('any')
url="https://github.com/AlexandrParkhomenko/aur/"
license=('LGPL')
depends=('coreutils')
# makedepends=('cmake')
source=("unamea-${pkgver}.tar.xz::https://github.com/AlexandrParkhomenko/aur/blob/master/unamea/releases/unamea-${pkgver}.tar.xz?raw=true")
sha256sums=("cebbadff8d85909134958f2ee471f814bbf05efad599de79f3b5b43e2fc21e3a")

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 unamea.sh "$pkgdir/usr/bin/unamea"
}
