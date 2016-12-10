# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=oh-my-git
pkgver=1.5
pkgrel=1
pkgdesc="An opinionated git prompt for bash and zsh"
arch=("any")
url="https://github.com/arialdomartini/oh-my-git"
license=("MIT")
optdepends=("awesome-terminal-fonts-patched")
source=("https://github.com/arialdomartini/oh-my-git/archive/v$pkgver.tar.gz")
md5sums=("8304430e724f2b7b2a700db6ef93f322")

package() {
  mkdir -p "$pkgdir/opt/$pkgname"

  cp -a "$srcdir/$pkgname-$pkgver/base.sh" "$pkgdir/opt/$pkgname/base.sh"
  cp -a "$srcdir/$pkgname-$pkgver/prompt.sh" "$pkgdir/opt/$pkgname/prompt.sh"
}

