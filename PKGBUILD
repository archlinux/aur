# Maintainer: A. Benz <hello@benz.dev>
pkgname=walker-bin
license=('MIT')
pkgver=0.12.8
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
depends=('gtk4-layer-shell' 'libvips' 'ffmpeg')
optdepends=('wl-clipboard: for clipboard module' 'libqalculate: for calculator module')
source_x86_64=("https://github.com/abenz1267/walker/releases/download/v$pkgver/walker_.${pkgver}_Linux_x86_64.tar.gz")
arch=('x86_64')
conflicts=('walker')
provides=('walker')
sha256sums_x86_64=('6ccbd89276b1bfec8f7259b101239cd5e8ee9a7df633c7fdc663b41632f36793')

package() {
  cd "$srcdir/"

  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
