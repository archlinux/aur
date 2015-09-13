# Maintainer: helix <stargr@gmail.com>
pkgname=debtap
pkgver=2.3.2
pkgrel=1
pkgdesc='A script to convert .deb packages to Arch Linux packages, focused on accuracy. Do not use it to convert packages that already exist on official repositories or can be built from AUR!'
arch=('any')
license=('GPL2')
depends=('bash' 'binutils' 'pkgfile' 'fakeroot')
url="https://github.com/helixarch/debtap"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/debtap/archive/$pkgver.tar.gz"
        "debtap.install")

sha512sums=('df3f411049d3312d80da765c37512dd31cb04da9900482d99b6046a713e6649c79303a5b9c4c6d7724ac2b401f09b0494a2e86a58d9c63e7ff2a917a0b78dfc6'
            '0b3b5815866cfa9c5c32c922dcf8f50c4a84c9cdf83c2e30a86d2113a88ea52d8780848205748f5e349e364c26fb60a5bc91ffbdd7d8e0a4f2b9327c636b2564')

install=debtap.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 debtap "$pkgdir/usr/bin/debtap"
}
