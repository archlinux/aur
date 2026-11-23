# Maintainer: isaacangello <isaacangello@inf.ufpell.edu.br>
pkgname=chphp
pkgver=0.1.0
pkgrel=1
pkgdesc="Manage multiple PHP installations on Arch Linux and install via php.new"
arch=('any')
url="https://github.com/isaacangello/chphp"
license=('MIT')
depends=('bash' 'curl' 'coreutils')
optdepends=('sudo: required to replace /usr/bin/php when running as a normal user')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eadbc293331f97f395732bb1e7851c7bbd65c1de8bdbb149b66f8dc0e1ebba02')

package() {
  cd "$srcdir/chphp-$pkgver"

  install -Dm755 chphp "$pkgdir/usr/bin/chphp"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
