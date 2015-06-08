# Maintainer: helix <stargr@gmail.com>
pkgname=debtap-p64
pkgver=2.1.5
pkgrel=1
pkgdesc='A script to convert 32-bit .deb packages to pseudo-64-bit Arch Linux packages, focused on accuracy. Do not use it to convert packages that already exist on official repositories or can be built from AUR!'
arch=('x86_64')
license=('GPLv2')
depends=('bash' 'binutils' 'pkgfile' 'fakeroot')
url="https://github.com/helixarch/debtap-p64"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/debtap-p64/archive/$pkgver.tar.gz"
        "debtap-p64.install")

sha512sums=('279f2ad63cbf9b944dc7cdf19e18b1af91efa82b4d5623fa08e95d0be2a07b981274cd8ff6890f6e9ff5e1c34f1c4781f304f858869bbbfac50c0a635ce0b556'
            '8dcaca5239949d43d18254159e3275e0bef37ff18b4f0e974b48ed681a9a5484dfba77fa41eae7d21d8f8d68cfb14123bf16c87a7a540e476c6d698a9caae989')

install=debtap-p64.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 debtap-p64 "$pkgdir/usr/bin/debtap-p64"
}
