# Maintainer: Lars Christensen <larsch@belunktum.dk>
pkgname=git-remove
pkgver=1.0
pkgrel=1
pkgdesc="Safely delete git clones and worktrees — refuses if any work would be lost"
arch=('any')
url="https://github.com/larsch/git-remove"
license=('MIT')
depends=('git' 'bash' 'coreutils')
source=("$pkgname-$pkgver.tar.gz::https://github.com/larsch/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41dee086fbe72398ef5737a12f6e3e974896b6536a2cc383e8b2315986d21a3c')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 git-remove         "$pkgdir/usr/bin/git-remove"
  install -Dm755 git-check-worktree "$pkgdir/usr/bin/git-check-worktree"
  install -Dm644 LICENSE            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md          "$pkgdir/usr/share/doc/$pkgname/README.md"
}
