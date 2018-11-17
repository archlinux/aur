pkgname=zola-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="An opinionated static site generator - Precompiled binary from official repository"
arch=('any')
url="https://github.com/getzola/zola"
license=('MIT')
provides=('zola')
conflicts=('zola')

source=("https://github.com/getzola/zola/releases/download/v${pkgver}/${pkgname/-bin}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('f7ab37b542461357862b6e91459a211a8cbeb872f84c6de227076e3d6db7eff7')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
