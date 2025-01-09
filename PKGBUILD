# Maintainer: A. Benz <hello@benz.dev>
pkgname=walker-bin
license=('MIT')
pkgver=0.11.19
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
depends=('gtk4-layer-shell' 'libvips' 'ffmpeg')
optdepends=('wl-clipboard: for clipboard module' 'libqalculate: for calculator module')
source_x86_64=("https://github.com/abenz1267/walker/releases/download/v$pkgver/walker_.${pkgver}_Linux_x86_64.tar.gz")
arch=('x86_64')
conflicts=('walker')
provides=('walker')
sha256sums_x86_64=('a7082e786d13e62e89a72e492d58904af6d8455ce5da025605a22a4be3fa47ed')

package() {
  cd "$srcdir/"

  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
