# Maintainer: Mittens2001 <mittens2001@opmbx.org>

pkgname=spm
pkgver=1.4.7
pkgrel=1
pkgdesc="simple password manager, a fork of mneum's tpm"
arch=('any')
url="https://notabug.org/kl3/spm"
license=('GPL')
depends=('gnupg')
source=("https://notabug.org/kl3/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('6871e91b3fc652863ad793ec58070392')

package() {
  cd "$srcdir"
  make PREFIX=/usr DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE "$pkgdir/usr/share/license/$pkgname/LICENSE"
}
