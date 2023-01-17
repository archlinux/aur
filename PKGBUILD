# Maintainer: rarick <tyler dot rarick at gmail dot com>

pkgname=tmux-plugin-manager
pkgver=3.1.0
_git_tag=v3.1.0
pkgrel=1
pkgdesc="tpm - Tmux Plugin Manager"
arch=('any')
_repo=tpm
url="https://github.com/tmux-plugins/$_repo"
license=('MIT')
makedepends=('git')
depends=('tmux>=1.9' 'bash')
install=$pkgname.install
source=("git+$url.git#tag=$_git_tag")
sha256sums=('SKIP')

package() {
  echo "  -> Installing tpm..."
  install -dDm 755 "$pkgdir/usr/share/$pkgname"
  cp -r $_repo/* "$pkgdir/usr/share/$pkgname"
}
