# Maintainer: Jonne Haß <me@mrzyx.de>
_projectname="password-store"
pkgname=pass-zsh-completion
pkgver=1.4.2
pkgrel=2
pkgdesc="stores, retrieves, generates, and synchronizes passwords securely - ZSH completion"
arch=('any')
url="http://zx2c4.com/projects/password-store/"
license=('GPL')
depends=('pass' 'zsh')
source=("http://git.zx2c4.com/password-store/snapshot/$_projectname-$pkgver.tar.xz")
md5sums=('c6382dbf5be4036021bf1ce61254b04b')

package() {
  cd "$srcdir/$_projectname-$pkgver/contrib"
  install -Dm644 pass.zsh-completion $pkgdir/usr/share/zsh/site-functions/_pass
}

# vim:set ts=2 sw=2 et:
