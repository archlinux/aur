# Maintainer: Lucas Hoffmann <l-m-h at web dot de>
# Contributor: fsckd <fsckdaemon at gmail dot com>
# Contributor: veox <veox at wre dot ath dot cx>

pkgname=zsh-history-substring-search
pkgver=1.0.1
pkgrel=1
pkgdesc="A ZSH plugin to search history, a clean-room implementation of the Fish shell feature"
arch=('any')
url="https://github.com/zsh-users/zsh-history-substring-search"
license=('BSD')
depends=('zsh')
conflicts=($pkgname-git)
install=zsh-history-substring-search.install
source=("https://github.com/zsh-users/$pkgname/archive/v$pkgver.tar.gz")
sha1sums=(2fd008a0b6b83ba5a75ce1886555f577d3dfbac0)

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d -m755 "$pkgdir/usr/share/zsh/plugins/$pkgname"
  install -m644 README.md "$pkgname".zsh "$pkgdir/usr/share/zsh/plugins/$pkgname"
}

# vim:set ts=2 sw=2 et:
