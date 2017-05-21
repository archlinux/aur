# Maintainer: Lex Black <autumn-wind at web dot de>

pkgname=rofi-pass
pkgver=1.5.0
pkgrel=2
pkgdesc="bash script to handle pass storages in a convenient way"
arch=('any')
url='https://github.com/carnager/rofi-pass'
license=('GPL')
depends=('xdg-utils' 'rofi' 'gawk' 'pass' 'xdotool' 'xclip')
optdepends=('passed-git: change fieldnames in password files')
conflicts=('rofi-pass-git')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/carnager/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('23c6bf26b1d13952bec7a7bb96083db1')


package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir/" PREFIX="/usr" install
}
