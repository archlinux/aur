# Maintainer: Lex Black <autumn-wind at web dot de>

pkgname=rofi-pass
pkgver=1.4
pkgrel=1
pkgdesc="bash script to handle pass storages in a convenient way"
arch=('any')
url='https://github.com/carnager/rofi-pass'
license=('GPL')
depends=('xdg-utils' 'rofi' 'gawk' 'pass' 'xdotool' 'xclip')
optdepends=('passed-git: change fieldnames in password files')
conflicts=('rofi-pass-git')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/carnager/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('17b07095a4672bf07c29219c7c6943d8')


package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
