# Maintainer: pancho horrillo <pancho at pancho dot name>

_pkgname=git-flow-completion
pkgname=gitflow-fishcompletion-avh
pkgver=0.6.0
pkgrel=1
pkgdesc="fish completion support for git-flow (AVH Edition)."
arch=('any')
url="https://github.com/petervanderdoes/$_pkgname"
license=('MIT')
depends=('fish' 'git' 'gitflow-avh')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('1082ad47938ec78045f4cbd12340a82960ba3de204c21a95e1166cb0b86e96dbbc3e5fc8af1945c951d5edd43b4026021761e8377795acbb87af3c1e391cb256')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -D -m 0644 git.fish "$pkgdir/usr/share/fish/vendor_completions.d/git.fish"
  install -D -m 0644 LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
