# Maintainer: Mittens2001 <mittens2001@opmbx.org>

pkgname=spm
pkgver=1.4.6
pkgrel=1
pkgdesc="simple password manager, a fork of mneum's tpm"
arch=('any')
url="https://notabug.org/kl3/spm"
license=('GPL')
depends=('gnupg')
source=("https://notabug.org/kl3/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7f2d31391697deb71b43d612199cc281f07ca5640484bb64fe94911912635d84')

package() {
  cd "$srcdir"
  make PREFIX=/usr DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE "$pkgdir/usr/share/license/$pkgname/LICENSE"
}
