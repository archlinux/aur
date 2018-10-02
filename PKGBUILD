# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=bundler-exec
pkgver=latest
pkgrel=1
pkgdesc=" Automatically run Ruby scripts with bundle exec"
arch=('any')
url="https://github.com/gma/bundler-exec"
license=('unknown')
depends=('ruby-bundler')
source=("git+https://github.com/gma/$pkgname.git")
md5sums=('SKIP')

package() {
  install -Dm 755 "$srcdir/$pkgname/$pkgname.sh" \
    "$pkgdir/etc/profile.d/bundlerexec.sh"
}
