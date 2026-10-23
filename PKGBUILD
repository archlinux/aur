# Maintainer: Keith Cirkel <keithamus@users.noreply.github.com>
pkgname=git-worktree-share
pkgver=0.1.4
pkgrel=1
pkgdesc="Share untracked files across git worktrees"
arch=('any')
url="https://github.com/keithamus/git-worktree-share"
license=('MIT')
depends=('bash' 'git')
source=("git-worktree-share-$pkgver.tar.gz::https://github.com/keithamus/git-worktree-share/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c9ca84c2f53377ad3b844be4466665fdfa40c153f43e6fafd251d46a92c7879c')

package() {
  cd "git-worktree-share-$pkgver"
  install -Dm755 "bin/git-worktree-share" "$pkgdir/usr/bin/git-worktree-share"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
