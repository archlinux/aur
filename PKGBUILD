# Maintainer: Keith Cirkel <keithamus@users.noreply.github.com>
pkgname=git-worktree-share
pkgver=0.1.6
pkgrel=1
pkgdesc="Share untracked files across git worktrees"
arch=('any')
url="https://github.com/keithamus/git-worktree-share"
license=('MIT')
depends=('bash' 'git')
source=("git-worktree-share-$pkgver.tar.gz::https://github.com/keithamus/git-worktree-share/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('91c0eb14e393f36e8fc847a863627a9d37f516ccf0b424cfe9e2a3202c2daf7f')

package() {
  cd "git-worktree-share-$pkgver"
  install -Dm755 "bin/git-worktree-share" "$pkgdir/usr/bin/git-worktree-share"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
