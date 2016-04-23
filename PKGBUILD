# Maintainer: helix <stargr@gmail.com>
pkgname=debtap
pkgver=2.8
pkgrel=1
pkgdesc='A script to convert .deb packages to Arch Linux packages, focused on accuracy. Do not use it to convert packages that already exist on official repositories or can be built from AUR!'
arch=('any')
license=('GPL2')
depends=('bash' 'binutils' 'pkgfile' 'fakeroot')
url="https://github.com/helixarch/debtap"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/debtap/archive/$pkgver.tar.gz"
        "debtap.install")

sha512sums=('b4571e9f15f472e4ca23edd2bcb473f2ac25dabdc51932e3f948a419faf8a30c4864871a87d181b969f2070844fd265270490854f0692b8e3b5f4fc533128d2e'
            '0b3b5815866cfa9c5c32c922dcf8f50c4a84c9cdf83c2e30a86d2113a88ea52d8780848205748f5e349e364c26fb60a5bc91ffbdd7d8e0a4f2b9327c636b2564')

install=debtap.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 debtap "$pkgdir/usr/bin/debtap"
}
