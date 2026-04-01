pkgname=check-command-git
pkgver=1.0
pkgrel=7
pkgdesc="CLI tool to verify file existence with recursive search and color output"
arch=('any')
url="https://github.com"
license=('MIT')
depends=('python' 'git')
source=("git+https://github.com")
md5sums=('SKIP')

package() {
  cd "$srcdir/check_command"
  install -Dm755 check "$pkgdir/usr/bin/check"
}




