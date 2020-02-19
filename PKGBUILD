# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=rofi-pass
pkgver=2.0.2
pkgrel=2
pkgdesc="bash script to handle pass storages in a convenient way"
arch=('any')
url='https://github.com/carnager/rofi-pass'
license=('GPL')
depends=('xdg-utils' 'rofi' 'gawk' 'pass' 'pwgen' 'xdotool' 'xclip')
optdepends=('pass-otp: for OTP support')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/carnager/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('28f59696911089c31b3f17bde281e3d79c3f757ecc4da61386719c6cff9b31c0944a2ac549d7838f06c249d4535c0dc107ba684115f15db42a24bfdb2f575437')

package() {
  make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" PREFIX="/usr" install
}
