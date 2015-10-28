# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=xfce4-terminal-colors-seoul256
pkgver=1.0.0
pkgrel=1
pkgdesc="Seoul256 theme for XFCE terminal"
arch=('any')
depends=('xfce4-terminal')
url="https://github.com/atweiden/xfce4-terminal-colors-seoul256"
license=('UNLICENSE')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver)
sha256sums=('73b273f181923141d176bdef0f5cf597bb138be1674eaf498b39f2df7a174b63')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -Dm 644 seoul256.theme \
    "$pkgdir/usr/share/xfce4/terminal/colorschemes/seoul256.theme"
}
