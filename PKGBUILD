# Maintainer: A. Benz <hello@benz.dev>
pkgname=walker-bin
license=('MIT')
pkgver=0.6.5
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
depends=('gtk4-layer-shell')
optdepends=('wl-clipboard: for clipboard module')
source_x86_64=("https://github.com/abenz1267/walker/releases/download/v$pkgver/walker_Linux_x86_64.tar.gz")
arch=('x86_64')
conflicts=('walker')
provides=('walker')
sha256sums_x86_64=('6e0ab1ca22981a78f662b188778916a7015677dc02fca7d4271f607d9eb6c8d7')

package() {
  cd "$srcdir/"

  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
