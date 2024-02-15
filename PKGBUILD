# Maintainer: crolbar <crolbar@crolbar.com>
_pkgname="matm"
pkgname="matm-bin"
pkgver=2.0
pkgrel=1
pkgdesc="A tool to watch anime, movies, tv shows and read manga from the comfort of the cli!"
arch=('x86_64')
url="https://github.com/crolbar/matm"
license=('GPL3')
depends=('mpv' 'fzf' 'zathura-cb')
provides=('matm')
conflicts=('matm-git')
optdepends=('vlc: an alternative video player for movies')
source=("https://github.com/crolbar/matm/releases/download/v$pkgver/matm-$pkgver.tar.gz")
md5sums=('SKIP')

package() {
  cd "$srcdir"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
}
