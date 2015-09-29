# Maintainer: helix <stargr@gmail.com>
pkgname=debtap-p64
pkgver=2.4.1
pkgrel=1
pkgdesc='A script to convert 32-bit .deb packages to pseudo-64-bit Arch Linux packages, focused on accuracy. Do not use it to convert packages that already exist on official repositories or can be built from AUR!'
arch=('x86_64')
license=('GPL2')
depends=('bash' 'binutils' 'pkgfile' 'fakeroot')
url="https://github.com/helixarch/debtap-p64"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/debtap-p64/archive/$pkgver.tar.gz"
        "debtap-p64.install")

sha512sums=('1b31cbc72ce516af8f58be18d463a788a0bdd06d01f2d8870e955d7c032693fb71b3d110ab72a6ff6d58ad228cd8a5ea7b452e2a1596155f2fed012035007fb9'
            '8dcaca5239949d43d18254159e3275e0bef37ff18b4f0e974b48ed681a9a5484dfba77fa41eae7d21d8f8d68cfb14123bf16c87a7a540e476c6d698a9caae989')

install=debtap-p64.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 debtap-p64 "$pkgdir/usr/bin/debtap-p64"
}
