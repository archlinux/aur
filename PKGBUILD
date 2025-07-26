# Contributor: VC365
pkgname=vc-clock
pkgver=0.1.1
pkgrel=2
pkgdesc="a lightweight Analog Clock applet"
arch=('x86_64')
url="https://github.com/VC365/vc-clock"
license=('Proprietary')
depends=('librsvg' 'gtk2')
makedepends=('git')
source=("git+https://github.com/VC365/vc-clock.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd "$srcdir/vc-clock"
	  install -Dm755 vc-clock "$pkgdir"/usr/bin/vc-clock
}
