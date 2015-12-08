# Maintainer: pancho horrillo <pancho at pancho dot name>

_pkgname=git-flow-completion
pkgname=gitflow-fishcompletion-avh
pkgver=0.5.2
pkgrel=1
pkgdesc="fish completion support for git-flow (AVH Edition)."
arch=('any')
url="https://github.com/petervanderdoes/$_pkgname"
license=('MIT')
depends=('fish' 'git' 'gitflow-avh')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('500cb6163ebb2bf9b996dd5bcac00efa857badfc95ee1d633f2b16803c6baae7315a96c713107645e0971be4736fe1eef747dc773eb50da138551be4838c21b3')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -D -m 0644 git.fish "$pkgdir/usr/share/fish/vendor_completions.d/git.fish"
  install -D -m 0644 LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
