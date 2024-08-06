# Maintainer: A. Benz <hello@benz.dev>
pkgname=walker-bin
license=('MIT')
pkgver=0.6.6
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
depends=('gtk4-layer-shell')
optdepends=('wl-clipboard: for clipboard module')
source_x86_64=("https://github.com/abenz1267/walker/releases/download/v$pkgver/walker_Linux_x86_64.tar.gz")
arch=('x86_64')
conflicts=('walker')
provides=('walker')
sha256sums_x86_64=('bb4af991535a289423e0e116df6a0fc29745ae7e5f82a7a1ad0d92dd81d982db')

package() {
  cd "$srcdir/"

  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
