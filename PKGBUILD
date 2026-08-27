# Maintainer: Piyush Raj <piyushxcoder@gamil.com>
pkgname=folklore-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Viewer for superlore docs — desktop and web app, one codebase"
arch=('x86_64')
url="https://github.com/PiyushXCoder/folklore"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('folklore')
conflicts=('folklore')
source=("folklore_${pkgver}_amd64.deb::https://github.com/PiyushXCoder/folklore/releases/download/v${pkgver}/folklore_${pkgver}_amd64.deb")
sha256sums=('685bae22d0fd866cbedfec8a6625cb5de5b193d18ee4f84239e6e2385e98135c')

package() {
  cd "$srcdir"
  ar x "folklore_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.gz -C "$pkgdir"
}
