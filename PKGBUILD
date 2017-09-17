# Contributor: mitts <mittens2001@opmbx.org>
# Maintainer:  Stefan Husmann <stefan-husmann@t-online.de>

pkgname=spm
pkgver=1.5.0
pkgrel=3
pkgdesc="simple password manager, a fork of mneum's tpm"
arch=('any')
url="https://notabug.org/kl3/spm"
license=('GPL')
depends=('gnupg')
source=("$pkgname-$pkgver.tar.gz::https://notabug.org/kl3/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('861b6bfd4f02bd5b9bc7697f5feebeaf')

package() {
  cd "$srcdir/spm"
  make PREFIX=/usr DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
