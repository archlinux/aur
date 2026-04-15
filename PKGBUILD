pkgname=lune-bin
pkgver=0.0.0
pkgrel=1
pkgdesc="Lune CLI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/gentij/lune"
license=('MIT')
provides=('lune')
conflicts=('lune')
source=("https://github.com/gentij/lune/releases/download/v${pkgver}/lune_linux_amd64.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/lune" "${pkgdir}/usr/bin/lune"
}
