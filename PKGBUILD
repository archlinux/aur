# Contributor: VC365
pkgname=vc-clock
pkgver=0.1.5
pkgrel=1
pkgdesc="a lightweight Analog Clock applet"
arch=('x86_64')
url="https://github.com/VC365/vc-clock"
license=('Proprietary')
depends=('librsvg' 'gtk2')
source=("https://github.com/VC365/vc-clock/releases/download/v$pkgver/vc-clock_v$pkgver.tar.xz")
sha256sums=('79b81b16b6598ad79d7a09beef3484696d63a0c3f4130f92f9802616448de115')

package() {
  cd "$srcdir"
	  install -Dm755 bin/vc-clock "$pkgdir"/usr/bin/vc-clock
}
