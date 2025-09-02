# Maintainer: teraflops <prietus@live.com>
pkgname=roon-now-playing-git
pkgver=1.0.0
pkgrel=2
pkgdesc="waybar module that shows now playing info from Roon using roon-kit, grabs lyrics and shows covers"
arch=('any')
url="https://gitlab.com/teraflops/roon_now_playing"
license=('MIT')
depends=('nodejs' 'roon-kit' 'python-requests')
makedepends=('git')
source=("git+$url.git"
        "roon-now-playing.install")
md5sums=('SKIP' 'SKIP')
install=roon-now-playing.install

package() {
  cd "$srcdir/roon_now_playing"
  cp -r usr "$pkgdir"
  cp -r etc "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

