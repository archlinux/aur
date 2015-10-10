# Maintainer: helix <stargr@gmail.com>
pkgname=debtap
pkgver=2.4.3
pkgrel=1
pkgdesc='A script to convert .deb packages to Arch Linux packages, focused on accuracy. Do not use it to convert packages that already exist on official repositories or can be built from AUR!'
arch=('any')
license=('GPL2')
depends=('bash' 'binutils' 'pkgfile' 'fakeroot')
url="https://github.com/helixarch/debtap"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/debtap/archive/$pkgver.tar.gz"
        "debtap.install")

sha512sums=('064c3dbc776ff9cf09f41092991acb420da7a9faa520c8275a5d0022fd5370aa1b8ab188db5b616c48d3e5b8dfce3fa5f8af0fd8bcc6b77602a56b6492422430'
            '0b3b5815866cfa9c5c32c922dcf8f50c4a84c9cdf83c2e30a86d2113a88ea52d8780848205748f5e349e364c26fb60a5bc91ffbdd7d8e0a4f2b9327c636b2564')

install=debtap.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 debtap "$pkgdir/usr/bin/debtap"
}
