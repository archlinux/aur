# Maintainer: A. Benz <hello@benz.dev>
pkgname=walker-bin
license=('MIT')
pkgver=0.6.9
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
depends=('gtk4-layer-shell')
optdepends=('wl-clipboard: for clipboard module')
source_x86_64=("https://github.com/abenz1267/walker/releases/download/v$pkgver/walker_.${pkgver}_Linux_x86_64.tar.gz")

arch=('x86_64')
conflicts=('walker')
provides=('walker')
sha256sums_x86_64=('0e54f9101d02cf4a03ec73ac77fe6c029d3f66ea0671b2d168ce4b6ce8f20f12')

package() {
  cd "$srcdir/"

  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
