# Maintainer: A. Benz <hello@benz.dev>
pkgname=walker-bin
license=('MIT')
pkgver=0.6.8
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
depends=('gtk4-layer-shell')
optdepends=('wl-clipboard: for clipboard module')
source_x86_64=("https://github.com/abenz1267/walker/releases/download/v$pkgver/walker_.${pkgver}_Linux_x86_64.tar.gz")

arch=('x86_64')
conflicts=('walker')
provides=('walker')
sha256sums_x86_64=('5bfbad59b5468ad16ea86bc31c304c51f1a2653eca7f2d62e40962e1d930e63a')

package() {
  cd "$srcdir/"

  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
