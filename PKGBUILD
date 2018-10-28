# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=oh-my-git
pkgver=r231.fd13327
pkgrel=1
pkgdesc="An opinionated git prompt for bash and zsh"
arch=("any")
url="https://github.com/arialdomartini/oh-my-git"
license=("MIT")
optdepends=("awesome-terminal-fonts-patched")
makedepends=("git")
source=("$pkgname::git+$url")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  install -d "$pkgdir/opt" && cp -a "$srcdir/$pkgname" "$_"
}
