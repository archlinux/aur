# Maintainer: Jonathan Rouleau <jonathan@rouleau.io>

pkgname=cmdline
pkgver=2.0
pkgrel=1
pkgdesc="Generates a kernel cmdline string from /etc/cmdline and /etc/cmdline.d/"
arch=('any')
url="https://github.com/jrouleau/cmdline"
license=('MIT')
depends=('bash' 'coreutils' 'sed')
source=("https://github.com/jrouleau/cmdline/archive/v${pkgver}.tar.gz")
sha256sums=('8e0268a6896c766a66a840bc16a1c18a26cb3cdc8bc27b552daa1ec59dade827')

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 0755 gencmdline "$pkgdir/usr/bin/gencmdline"
}
