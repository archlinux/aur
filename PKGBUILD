pkgname=cisa
pkgver=1.1
pkgrel=1
pkgdesc="A novelty prank program that spams fetch tools, prints CISA, and reveals a random file path"
arch=('any')
license=('MIT')
depends=('bash' 'fastfetch' 'neofetch' 'toilet' 'findutils' 'coreutils')
source=('cisa')
sha256sums=('SKIP')

package() {
  install -Dm755 cisa "$pkgdir/usr/bin/cisa"
}
