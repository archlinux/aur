# Maintainer: helix <stargr@gmail.com>
pkgname=debtap
pkgver=2.6
pkgrel=1
pkgdesc='A script to convert .deb packages to Arch Linux packages, focused on accuracy. Do not use it to convert packages that already exist on official repositories or can be built from AUR!'
arch=('any')
license=('GPL2')
depends=('bash' 'binutils' 'pkgfile' 'fakeroot')
url="https://github.com/helixarch/debtap"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/debtap/archive/$pkgver.tar.gz"
        "debtap.install")

sha512sums=('f8bf4566e3599aaf58eb41152e8dd6d59ce088a3f7d73ac7469246791cce54617042a1e0f06a11a60d9b5846ef536f29928e525929d2b90316b2db54d575de33'
            '0b3b5815866cfa9c5c32c922dcf8f50c4a84c9cdf83c2e30a86d2113a88ea52d8780848205748f5e349e364c26fb60a5bc91ffbdd7d8e0a4f2b9327c636b2564')

install=debtap.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 debtap "$pkgdir/usr/bin/debtap"
}
