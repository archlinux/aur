# Maintainer: Jonathan Rouleau <jonathan@rouleau.io>

pkgname=cmdline
pkgver=1.0
pkgrel=1
pkgdesc="Generates a kernel cmdline string from /etc/cmdline and /etc/cmdline.d/"
arch=('any')
url="https://github.com/jrouleau/cmdline"
license=('MIT')
depends=('sh' 'coreutils' 'sed')
source=("https://github.com/jrouleau/cmdline/archive/v${pkgver}.tar.gz")
sha256sums=('0d342c6d549d4ff91ec77fcb207ac296104201b185fea0ec9db8f2389b002305')

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 0755 gencmdline "$pkgdir/usr/bin/gencmdline"
}
