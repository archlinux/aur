# Maintainer: isaacangello <isaacangello@inf.ufpell.edu.br>
pkgname=chphp
pkgver=0.1.1
pkgrel=1
pkgdesc="Manage multiple PHP installations on Arch Linux and install via php.new"
arch=('any')
url="https://github.com/isaacangello/chphp"
license=('MIT')
depends=('bash' 'curl' 'coreutils')
optdepends=('sudo: required to replace /usr/bin/php when running as a normal user')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('35549bdf27c3fa3fd85b5bd17e604c3d331d4d218874f046c3308a040d5f33e2')

package() {
  cd "$srcdir/chphp-$pkgver"

  install -Dm755 chphp "$pkgdir/usr/bin/chphp"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
