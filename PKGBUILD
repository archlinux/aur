# Maintainer: lyj404 <lyj404@outlook.com>

pkgname=proxy-term-bin
pkgver=0.5.0
pkgrel=2
pkgdesc="A desktop proxy management tool with GUI"
arch=('x86_64')
url="https://github.com/lyj404/proxy_term"
license=('Apache')
depends=('xdotool')
makedepends=()
conflicts=('proxy-term')
provides=('proxy-term')
source=("${url}/releases/download/v${pkgver}/proxy_term-${pkgver}-x86_64-linux-arch.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 proxy-term "${pkgdir}/usr/bin/proxy-term"
  install -Dm644 proxy-term.desktop "${pkgdir}/usr/share/applications/proxy-term.desktop"
  install -Dm644 logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/proxy-term.svg"
}
