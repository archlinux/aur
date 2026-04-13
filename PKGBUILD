pkgname=fast-syntax-highlighting-git
pkgver=r917.3d574cc
pkgrel=1
pkgdesc="Fast syntax highlighting for Zsh (git version)"
arch=('any')
url="https://github.com/zdharma-continuum/fast-syntax-highlighting"
license=('MIT')
depends=('zsh')
source=("git+https://github.com/zdharma-continuum/fast-syntax-highlighting.git")
md5sums=('SKIP')

pkgver() {
  cd fast-syntax-highlighting
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd fast-syntax-highlighting

  install -dm755 "$pkgdir/usr/share/zsh/plugins/fast-syntax-highlighting"
  cp -r . "$pkgdir/usr/share/zsh/plugins/fast-syntax-highlighting/"
}

install=fast-syntax-highlighting-git.install
