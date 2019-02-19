# Maintainer: Jonathan Rouleau <jonathan@rouleau.io>

pkgname=cmdline
pkgver=2.1
pkgrel=1
pkgdesc="Generates a kernel cmdline string from /etc/cmdline and /etc/cmdline.d/"
arch=('any')
url="https://github.com/jrouleau/cmdline"
license=('MIT')
depends=('bash' 'coreutils' 'sed')
source=("https://github.com/jrouleau/cmdline/archive/v${pkgver}.tar.gz")
sha256sums=('e8982ff7fbc3ff56d84a8649b8ca6e36c4e03dad307b1b4bdecfb6f7bf2586b2')

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 0755 gencmdline "$pkgdir/usr/bin/gencmdline"
}
