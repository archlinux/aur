# Maintainer:  graypawn <choi.pawn @gmail.com>
pkgname=yusuke-git
_gitname=yusuke
pkgver=20151010.736
pkgrel=1
pkgdesc="pacman update notifier"

arch=('i686' 'x86_64')
url="https://github.com/graypawn/yusuke"
license=('GPL3')

conflicts=('yusuke')
depends=('pacman' 'libnotify' 'bash')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 yusuke "$pkgdir/usr/bin/yusuke"
  install -Dm755 yusuke.desktop "$pkgdir/usr/share/yusuke/yusuke.desktop"
}
