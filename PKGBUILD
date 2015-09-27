# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=xfce4-terminal-colors-jellyx
pkgver=1.0.0
pkgrel=1
pkgdesc="JellyX theme for XFCE terminal"
arch=('any')
depends=('xfce4-terminal')
url="https://github.com/atweiden/xfce4-terminal-colors-jellyx"
license=('UNLICENSE')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver)
sha256sums=('250597ceb3a9e5558150e7ee5d5a00d827cda91473d12cab49c094e01e8e1b72')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -Dm 644 jellyx.theme \
    "$pkgdir/usr/share/xfce4/terminal/colorschemes/jellyx.theme"
}
