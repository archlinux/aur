pkgname=xfce4-terminal-base16-colors-git
pkgver=1.0.0
pkgrel=1
pkgdesc="JellyX theme for XFCE terminal"
arch=('any')
depends=('xfce4-terminal')
url="base16-colors-git"
license=('UNLICENSE')
source=($pkgname::git://github.com/afg984/base16-xfce4-terminal)
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"

  msg2 'Installing...'
  install -dm755 "$pkgdir/usr/share/xfce4/terminal/colorschemes"
  install -Dm 644 colorschemes/*.theme \
    $pkgdir/usr/share/xfce4/terminal/colorschemes/
}

