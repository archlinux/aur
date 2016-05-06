# Maintainer: zekeer <isoniasid@gmail.com> 

pkgname=arc-dark-xfce4-terminal
pkgver=1
pkgrel=1
pkgdesc="Arc-Dark colorscheme for xfce4-terminal"
arch=('any')
depends=('xfce4-terminal')
url="https://manjaro.ru/"
license=('GPL3')
source=(https://manjaro.ru/aur/arc-dark-xfce4-terminal/$pkgname.tar.gz)
md5sums=('f3f72afd7b788849e21a240643d4ea2d')

package() {
  cd "$srcdir/"

  msg2 'Installing...'
  install -Dm 644 arc-dark.theme \
    "$pkgdir/usr/share/xfce4/terminal/colorschemes/arc-dark.theme"
}
