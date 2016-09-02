# Maintainer: Mittens2001 <mittens2001@opmbx.org>

pkgname=spm
pkgver=1.4.6
pkgrel=3
pkgdesc="simple password manager, a fork of mneum's tpm"
arch=('any')
url="https://notabug.org/kl3/spm"
license=('GPL')
depends=('gnupg')
source=("https://notabug.org/kl3/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3ef3141b36228609c2123a2660896aeae6a2c769a53fcdb4da69ef73ecc0c149')

package() {
  cd "$srcdir"
  make PREFIX=/usr DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE "$pkgdir/usr/share/license/$pkgname/LICENSE"
}
