pkgname=yaud
pkgver=1.0.0
pkgrel=1
pkgdesc="YAUD: Yet Another User Defender, an app that defends users from dangerous commands."
arch=('x86_64')
url="https://github.com/npc-gnu/yaud-aur"
license=('GPLv3')
depends=('bash' 'coreutils')
source=("git+https://github.com/npc-gnu/yaud-aur.git")
sha256sums=('SKIP')

build() {
  return 0
}

package() {
  cd "$srcdir"
  install -Dm755 yaud "$pkgdir/usr/bin/yaud"
}

