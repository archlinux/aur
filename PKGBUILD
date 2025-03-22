pkgname=abinot
pkgver=1.0.0
pkgrel=1
pkgdesc="Abinot for Arch Linux"
arch=('x86_64')
url="https://abinot.ir/arch-package"
license=('GPL3')
depends=('bash' 'yay' 'base-devel' 'git' 'python')
source=('abinot-setup.sh')
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/abinot-setup.sh" "$pkgdir/usr/bin/abinot"
}
