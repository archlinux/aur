# Maintainer: Keith Cirkel <keithamus@users.noreply.github.com>
pkgname=git-worktree-share
pkgver=0.1.5
pkgrel=1
pkgdesc="Share untracked files across git worktrees"
arch=('any')
url="https://github.com/keithamus/git-worktree-share"
license=('MIT')
depends=('bash' 'git')
source=("git-worktree-share-$pkgver.tar.gz::https://github.com/keithamus/git-worktree-share/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b8b7d4fd7b3c26f470f31ab4e4b8c3ac3ebf45b541ff2f77d8b191fbc5f9ca26')

package() {
  cd "git-worktree-share-$pkgver"
  install -Dm755 "bin/git-worktree-share" "$pkgdir/usr/bin/git-worktree-share"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
